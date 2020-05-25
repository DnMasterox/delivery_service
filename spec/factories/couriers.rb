FactoryBot.define do
  factory :courier do
    sequence(:email) { |n| "test#{n}@test.test" }
    sequence(:name) { |n| "tester#{n}" }
  end
end
