class Reservation < ActiveRecord::Base
  belongs_to :room

  validates :room, :arrival, :departure, presence: true
  validate :room_not_occupied, :departure_later_than_arrival
  validate :arrival_later_than_today, on: :create

  before_validation do |reservation|
    unless reservation.room
      category = RoomCategory.find(room_category_id)
      unless (reservation.room = category.free_room(arrival, departure))
        errors[:base] << 'Извините, нет свободных номеров за выбранный период'
      end
    end
  end

  attr_accessor :room_category_id

  def self.overlapping_reservations(arrival, departure)
    where { ((reservations.arrival < departure) & (reservations.departure > arrival)) |
        ((reservations.departure > arrival) & (reservations.arrival < departure)) }
  end

  scope :active, -> { where{ (canceled == false) & (arrival >= Date.today) } }

  default_scope { active }

  def cancel
    self.canceled = true
    save
  end

  private

  def arrival_later_than_today
    if arrival <= Date.today
      errors.add(:arrival, 'не может быть раньше, чем завтра')
    end
  end

  def departure_later_than_arrival
    if departure && arrival && departure <= arrival
      errors.add(:departure, 'должна быть позднее даты заезда')
    end
  end

  def room_not_occupied
    if room && room_id_changed? && room.reservations.overlapping_reservations(arrival, departure).any?
      errors.add(:room, 'занята на выбранном периоде')
    end
  end
end
