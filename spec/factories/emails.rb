# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    sequence :address do |n|
      "client#{n}@example.com"
    end
  end
end
