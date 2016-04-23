FactoryGirl.define do
  factory :interested_company do
    association :company, factory: :company
    association :project, factory: :project
  end
end
