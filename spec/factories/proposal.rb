FactoryGirl.define do
  factory :proposal do
    association :company, factory: :company
    association :project, factory: :project
    body "i would like to work on this project"
  end
end
