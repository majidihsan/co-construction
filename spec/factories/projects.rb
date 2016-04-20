FactoryGirl.define do
  factory :project do
    title "living room"
    description "i want to redo my living room"
    duration "2 months"
    category "Mill Work"
    address "4 bradford terrace, MA"
    zipcode 02446
    association :user, factory: :user
  end
end
