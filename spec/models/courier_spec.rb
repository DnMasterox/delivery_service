# frozen_string_literal: true

RSpec.describe Courier do
  let(:courier) { FactoryBot.create(:courier, :image) }
  context 'courier is valid' do
    it { expect(courier).to have_attached_file(:image) }
    it {
      expect(courier).to validate_attachment_content_type(:image)
        .allowing('image/png', 'image/jpg', 'image/gif')
    }
  end
  context 'courier is non-valid' do
    let(:courier) { FactoryBot.create(:courier, :real) }
    it { expect(courier).not_to validate_attachment_presence(:image) }
  end
end
