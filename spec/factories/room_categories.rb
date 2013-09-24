# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room_category do
    name "Люкс"
    description 'Номер "Люкс" состоит из двух раздельных комнат - гостиной и спальни, ванной комнаты и гостевого туалета.'

    factory :room_category_with_rooms do
      rooms { 3.times.map { build(:room, category: nil) } }
    end
  end
end
