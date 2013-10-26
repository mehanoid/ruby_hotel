# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_information do
    emails { [build(:email)] }
    phones { [build(:phone)] }
  end
end
