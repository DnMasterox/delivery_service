# frozen_string_literal: true

RSpec.describe Courier do
  let(:courier) { FactoryBot.create(:courier, :avatar) }
  context 'courier is valid' do
    it { expect(courier).to have_attached_file(:avatar) }
    it {
      expect(courier).to validate_attachment_content_type(:avatar)
        .allowing('image/png', 'image/jpg', 'image/gif')
    }
  end
  context 'courier is non-valid' do
    let(:courier) { FactoryBot.create(:courier, :real) }
    it { expect(courier).not_to validate_attachment_presence(:avatar) }
  end
end
