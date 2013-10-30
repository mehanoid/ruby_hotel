class Reservation < ActiveRecord::Base
  include Concerns::ArrivalDeparture
  include Concerns::NestedClientBuilder

  belongs_to :room
  belongs_to :client

  validates :room, :client, presence: true
  validate :room_not_occupied, :departure_later_than_arrival
  validate :arrival_later_than_today, on: :create

  before_validation do |reservation|
    if !reservation.room && room_category_id
      category = RoomCategory.find(room_category_id)
      unless (reservation.room = category.free_room(arrival, departure))
        errors[:base] << 'Извините, нет свободных номеров за выбранный период'
      end
    end
    reservation.build_client unless reservation.client
  end

  attr_accessor :room_category_id
  accepts_nested_attributes_for :client

  scope :active, -> { where { (canceled == false) & (arrival >= Date.today) } }

  default_scope { active }

  def cancel
    self.canceled = true
    save
  end

  private

  def arrival_later_than_today
    if arrival && arrival <= Date.today
      errors.add(:arrival, 'не может быть раньше, чем завтра')
    end
  end

  def room_not_occupied
    if room && room_id_changed? && room.reservations.overlapping_with(arrival, departure).any?
      errors.add(:room, 'занята на выбранном периоде')
    end
  end
end
