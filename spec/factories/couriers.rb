# frozen_string_literal: true

FactoryBot.define do
  factory :courier do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    trait :real do
      email { 'test@test.test' }
      password { 'password' }
    end
  end
end
