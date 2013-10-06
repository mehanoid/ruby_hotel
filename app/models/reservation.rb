class Reservation < ActiveRecord::Base
  belongs_to :room

  validates :room, :arrival, :departure, presence: true
  validate :room_not_occupied, :departure_later_than_arrival

  before_validation do |reservation|
    unless reservation.room
      category = RoomCategory.find(room_category_id)
      unless (reservation.room = category.free_room(arrival, departure))
        errors[:base] << 'Извините, нет свободных номеров за выбранный период'
      end
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

  private

  def departure_later_than_arrival
    if departure && arrival && departure <= arrival
      errors.add(:departure, 'должна быть позднее даты заезда')
    end
  end

  def room_not_occupied
    if room && room.reservations.where { sift(:overlapping_reservations, arrival, departure) }.any?
      errors.add(:room, 'занята на выбранном периоде')
    end
  end
end
