# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :placement do
    association :room, factory: :room_with_category
    arrival { Date.today }
    departure { arrival + 5.days }
  end
end
