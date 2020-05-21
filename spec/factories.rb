FactoryBot.define do

  factory :package do
    estimated_delivery_date { Date.today }

    trait :processing do
      delivery_status { :processing }
    end
    trait :delivered do
      delivery_status { :delivered }
    end
    trait :cancelled do
      delivery_status { :cancelled }
    end
  end
end
