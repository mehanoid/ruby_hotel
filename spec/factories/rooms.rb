# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    sequence(:number)

    factory(:room_with_category) do
      association :category, factory: :room_category
    end
  end
end
