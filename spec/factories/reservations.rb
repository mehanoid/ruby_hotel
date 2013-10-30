# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    arrival { 1.day.from_now }
    departure { arrival + 5.days }
    association :room, factory: :room_with_category
    client

    trait :with_nested_attributes do
      client_attributes { attributes_for(:client, :with_nested_attributes) }
    end
  end
end
