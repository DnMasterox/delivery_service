# frozen_string_literal: true

FactoryBot.define do
  factory :package_assignment do
    courier
    package
  end
end
