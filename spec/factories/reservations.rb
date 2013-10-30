# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    arrival { 1.day.from_now }
    departure { arrival + 5.days }
    association :room, factory: :room_with_category
    association :client
  end
end
