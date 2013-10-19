# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :placement do
    association :room, factory: :room_with_category
    arrival '2013-10-01'
    departure '2013-10-05'
  end
end
