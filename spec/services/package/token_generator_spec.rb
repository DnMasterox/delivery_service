# frozen_string_literal: true

RSpec.describe Package::TokenGenerator do
  let(:package) { FactoryBot.create(:package) }
  subject { Package::TokenGenerator.new(package[:id]) }
  describe '#call' do
    context 'when package is valid' do
      it do
        subject.call
        expect(package.reload.confirmation_expiration).to be_present
        expect(package.reload.confirmation_token).to be_present
      end
    end
    context 'when package is invalid' do
      it do
        subject.call
        expect(package.confirmation_expiration).to be_nil
        expect(package.confirmation_token).to be_nil
      end
    end
  end
  describe '#package' do
    context 'when package exists' do
      it do
        expect(subject.package).to eq(package)
      end
    end
  end
  describe '#success?' do
    context 'when token generated successfully' do
      it do
        subject.call
        expect(subject).to be_success
      end
    end
  end
end
