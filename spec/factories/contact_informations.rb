# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_information do
    emails { [build(:email)] }
    phones { [build(:phone)] }

    trait :with_nested_attributes do
      phones_attributes { [attributes_for(:phone)] }
      emails_attributes { [attributes_for(:email)] }
    end
  end
end
