RSpec.describe DeliveryManager, type: :model do
  let(:delivery_manager) { build :delivery_manager }

  it "is enabled" do
    expect(delivery_manager.enabled).to be true
  end
end
