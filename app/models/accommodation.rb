class Accommodation < ActiveRecord::Base
  include Concerns::NestedClientBuilder

  belongs_to :client
  has_many :placements, inverse_of: :accommodation
  accepts_nested_attributes_for :client, :placements

  validates :client, :placements, presence: true
  validates :arrival, :departure, :room_category_id, presence: true, unless: :need_placement_params?

  before_validation :get_data_from_reservation
  before_validation :build_placement_from_params

  attr_accessor :reservation_id, :room_category_id
  attr_writer :arrival, :departure

  def arrival
    placements.first.arrival
  end

  def departure
    placements.last.departure
  end

  def room
    placements.last.room
  end

  private

  def get_data_from_reservation
    return unless reservation_id
    reservation = Reservation.find(reservation_id)
    placements.build(arrival: reservation.arrival, departure: reservation.departure, room: reservation.room)
    self.client = reservation.client
    reservation.cancel
  end

  def build_placement_from_params
    return if need_placement_params?
    room = nil
    if room_category_id
      room = RoomCategory.find(room_category_id).free_room(arrival, departure)
      errors[:base] << 'Нет свободных номеров за выбранный период' unless room
    end
    placements.build(arrival: @arrival, departure: @departure, room: room)
  end

  def need_placement_params?
    placements.any? || reservation_id
  end
end
