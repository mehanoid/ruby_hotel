# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    first_name 'Иван'
    middle_name 'Иванович'
    last_name 'Иванов'
    birsday '1990-10-25'
    association :contact_information
  end
end
