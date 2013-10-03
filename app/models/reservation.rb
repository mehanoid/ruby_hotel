class Reservation < ActiveRecord::Base
  belongs_to :room

  validates :room, :arrival, :departure, presence: true

  validate do
    if room.reservations.where { sift(:overlapping_reservations, arrival, departure) }.any?
      errors.add(:room, 'занята на выбранном периоде')
    end
  end

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

  sifter :overlapping_reservations do |arrival, departure|
    ((reservations.arrival < departure) & (reservations.departure > arrival)) |
        ((reservations.departure > arrival) & (reservations.arrival < departure))
  end

end
