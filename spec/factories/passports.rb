# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :passport do
    number "MyString"
    date_of_issue "2013-10-25"
    issuing_authority "MyString"
    client nil
  end
end
