# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password '12345678'
    role :receptionist

    factory :admin do
      role :admin
    end
  end
end
