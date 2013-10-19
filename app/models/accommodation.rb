class Accommodation < ActiveRecord::Base

  attr_accessor :reservation_id

  has_many :placements, inverse_of: :accommodation
  accepts_nested_attributes_for :placements

  validates :placements, presence: true

  before_validation :get_data_from_reservation

  private

  def get_data_from_reservation
    return unless reservation_id
    reservation = Reservation.find(reservation_id)
    placements.build(arrival: reservation.arrival, departure: reservation.departure, room_id: reservation.room_id)
  end
end
