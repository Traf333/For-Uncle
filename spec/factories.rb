FactoryGirl.define do
  factory :seller do
    sequence(:name)  { |n| "Person #{n}" }
    password                 "traf333"
    password_confirmation    "traf333"
  end
end