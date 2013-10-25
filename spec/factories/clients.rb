# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    birsday "2013-10-25"
  end
end
