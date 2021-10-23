# frozen_string_literal: true

RSpec.describe Courier do
  let(:courier) { FactoryBot.create(:courier, :image) }
  context 'courier is valid' do
    it {
      expect(courier.image.attached?).to be true
    }
  end
  context 'courier is non-valid' do
    let(:courier) { FactoryBot.create(:courier, :real) }
    it { expect(courier.image.attached?).to be false }
  end
end
