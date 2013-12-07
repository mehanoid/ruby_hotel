# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    trait :ivan do
      first_name 'Иван'
      middle_name 'Иванович'
      last_name 'Иванов'
    end

    trait :petr do
      first_name 'Пётр'
      middle_name 'Петрович'
      last_name 'Петров'
    end

    trait :alexandr do
      first_name 'Александр'
      middle_name 'Сергеевич'
      last_name 'Пушкин'
    end

    ivan
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
