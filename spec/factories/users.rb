FactoryGirl.define do
  factory :user do
    name "Test User"
    sequence(:email) { |n| "user#{n}@co-construction.xyz" }
    password "please123"

    trait :admin do
      role 'admin'
    end
  end
end
