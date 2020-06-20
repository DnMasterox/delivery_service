# frozen_string_literal: true

RSpec.describe Package::Picker do
  let(:package) { FactoryBot.create(:package, :assigned) }
  subject { Package::Picker.new(package[:id]) }
  describe '#call' do
    context 'when package status assigned' do
      it do
        subject.call
        expect(package.reload).to be_pickuped_delivery_status
      end
    end
  end
  describe '#package' do
    context 'when package with assigned status exists' do
      it do
        expect(subject.package).to eq(package)
      end
    end
    context 'when there is no packages with assigned status' do
      let(:package) { FactoryBot.create(:package) }
      it do
        subject.call
        expect(subject.package).to be_nil
      end
    end
  end
  describe '#success?' do
    context 'when package pickup successful' do
      it do
        subject.call
        expect(subject.success?).to be true
      end
    end
    context 'when package pickup failed' do
      let(:package) { FactoryBot.create(:package) }
      it do
        subject.call
        expect(subject.success?).to be_falsey
      end
    end
  end
end
