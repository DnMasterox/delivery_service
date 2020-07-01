# frozen_string_literal: true

FactoryBot.define do
  factory :package do
    estimated_delivery_date { Time.zone.today }
    trait :processing do
      delivery_status { 'processing' }
    end
    trait :assigned do
      delivery_status { 'assigned' }
    end
    trait :delivered do
      delivery_status { 'delivered' }
    end
    trait :valid_confirmation_token do
      delivery_status { 'assigned' }
      confirmation_expiration { Time.current + 1.minute }
      confirmation_token { 1 }
    end
    trait :invalid_confirmation_token do
      delivery_status { 'assigned' }
      confirmation_expiration { Time.current - 1.minute }
      confirmation_token { 2 }
    end
  end
end
