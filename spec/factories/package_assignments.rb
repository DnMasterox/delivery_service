# frozen_string_literal: true

FactoryBot.define do
  factory :package_assignment do
    courier
    package
    trait :processing_delivery_status do
      package { FactoryBot.create(:package, :processing) }
    end
  end
end
