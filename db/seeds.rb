# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'

User.delete_all
User::ROLES.each do |role|
  FactoryGirl.create(:user, role: role, email: "#{role}@example.com")
end

RoomCategory.delete_all
Room.delete_all
FactoryGirl.create(:room_category_with_rooms, :standard, rooms_count: 10)
FactoryGirl.create(:room_category_with_rooms, :junior, rooms_count: 5)
FactoryGirl.create(:room_category_with_rooms, :deluxe, rooms_count: 1)

Reservation.unscoped.delete_all
Accommodation.delete_all
Placement.delete_all