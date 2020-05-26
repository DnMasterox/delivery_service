# frozen_string_literal: true

FactoryBot.define do
  factory :package do
    estimated_delivery_date { Time.zone.today }
  end
end
