# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    arrival { Date.today }
    departure { arrival + 5.days }
    association :room_category, factory: :room_category_with_rooms
    client

    trait :with_nested_attributes do
      client_attributes { attributes_for(:client, :with_nested_attributes) }
    end
  end
end
