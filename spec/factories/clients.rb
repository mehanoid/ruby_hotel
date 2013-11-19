# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    first_name 'Иван'
    middle_name 'Иванович'
    last_name 'Иванов'
    contact_information

    trait :with_nested_attributes do
      contact_information_attributes { attributes_for(:contact_information, :with_nested_attributes) }
    end

    factory :client_for_accommodation do
      with_nested_attributes
      passport_attributes { attributes_for(:passport) }
      birthday '1990-10-25'
    end
  end
end
