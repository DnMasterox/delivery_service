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
  end
end
