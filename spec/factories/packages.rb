FactoryBot.define do

  factory :package do
    estimated_delivery_date { Date.today }
  end
end
