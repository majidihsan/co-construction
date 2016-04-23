FactoryGirl.define do
  factory :company do
    name "Paradise Construction"
    category "Mill Work"
    address "great street, NY"
    zipcode 02446
    phone 8572128902
    working_hours "9am - 5pm"
    working_since 1989
    association :user, factory: :user
  end
end
