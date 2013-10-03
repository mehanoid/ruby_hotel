class Reservation < ActiveRecord::Base
  belongs_to :room

  validates :room, presence: true

  before_validation do |reservation|
    unless reservation.room
      category = RoomCategory.find(room_category_id)
      reservation.room = category.free_room(arrival, departure)
    end
  end

  attr_writer :room_category_id

  def room_category_id
    @room_category_id ||= room.try(:category_id) || nil
  end
end
