# frozen_string_literal: true

FactoryBot.define do
  factory :courier do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    trait :real do
      email { 'test@test.test' }
      password { 'password' }
    end
    trait :image do
      email { 'test1@test.test' }
      password { 'password' }
      after(:build) do |courier|
        courier.image.attach(io: File.open(Rails.root.join('spec/support/fixtures/avatar.jpg')), filename: 'avatar.jpg', content_type: 'image/jpeg')
      end
      #image { File.new(Rails.root.join('spec/support/fixtures/avatar.jpg')) }
    end
  end
end
