RSpec.describe Package, type: :model do
  let(:package) { FactoryBot.create(:package) }

  it "has enum of delivery statuses" do
    should define_enum_for(:delivery_status).
        with_values(
            { new: 0,
             processing: 1,
             delivered: 2,
             cancelled: 3 }
        ).
        with_suffix
  end
  it "has tracking number in strict format" do
    expect(package.tracking_number).to match(/\AYA\d{8}AA\z/)
  end
end
