# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :placement do
    room_category_id { create(:room_category_with_rooms)}
    arrival { Date.today }
    departure { arrival + 5.days }
  end
end
