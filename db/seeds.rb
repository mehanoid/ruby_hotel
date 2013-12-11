# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == 'development'
  require 'factory_girl_rails'

  User::ROLES.each do |role|
    FactoryGirl.create(:user, role: role, email: "#{role}@example.com")
  end

  FactoryGirl.create(:room_category_with_rooms, :standard, rooms_count: 10)
  FactoryGirl.create(:room_category_with_rooms, :junior, rooms_count: 5)
  FactoryGirl.create(:room_category_with_rooms, :deluxe, rooms_count: 1)

  FactoryGirl.create(:reservation, room_category: RoomCategory.first,
                     client: (FactoryGirl.create(:client, :ivan)))
  FactoryGirl.create(:reservation, room_category: RoomCategory.first,
                     arrival: 5.days.from_now, departure: 10.days.from_now,
                     client: (FactoryGirl.create(:client, :petr)))
  FactoryGirl.create(:reservation, room_category: RoomCategory.first,
                     arrival: 3.days.from_now, departure: 12.days.from_now,
                     client: (FactoryGirl.create(:client, :alexandr)))
end