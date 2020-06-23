# frozen_string_literal: true

RSpec.describe Package::Canceller do
  describe '#call' do
    subject { described_class }
    context 'when package status new' do
      let(:package) { FactoryBot.create(:package) }
      it do
        subject.call(package[:id])
        expect(package.reload).to be_cancelled_delivery_status
      end
    end
    context 'when package status processing' do
      let(:package) { FactoryBot.create(:package, :processing) }
      it do
        subject.call(package[:id])
        expect(package.reload).to be_cancelled_delivery_status
      end
    end
    context 'when package status assigned' do
      let(:package) { FactoryBot.create(:package, :assigned) }
      it do
        subject.call(package[:id])
        expect(package.reload).to be_assigned_delivery_status
      end
    end
    context 'when package status delivered' do
      let(:package) { FactoryBot.create(:package, :delivered) }
      it do
        subject.call(package[:id])
        expect(package.reload).to be_delivered_delivery_status
      end
    end
  end
end
