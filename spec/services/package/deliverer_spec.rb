# frozen_string_literal: true

RSpec.describe Package::Deliverer do
  let(:package) { FactoryBot.create(:package, :valid_confirmation_token) }
  subject { Package::Deliverer.new(package[:confirmation_token]) }
  describe '#call' do
    context 'when package is valid' do
      it do
        subject.call
        expect(package.reload).to be_delivered_delivery_status
      end
    end
    context 'when package is invalid' do
      let(:package) { FactoryBot.create(:package, :invalid_confirmation_token) }
      it do
        subject.call
        expect(package.reload).not_to be_delivered_delivery_status
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
    context 'when package delivery successful' do
      it do
        subject.call
        expect(subject).to be_success
      end
    end
    context 'when package pickup failed' do
      let(:package) { FactoryBot.create(:package) }
      it do
        expect(subject).not_to be_success
      end
    end
  end
end
