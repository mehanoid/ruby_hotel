class Accommodation < ActiveRecord::Base

  attr_accessor :reservation_id

  belongs_to :client
  has_many :placements, inverse_of: :accommodation
  accepts_nested_attributes_for :placements

  validates :client, :placements, presence: true

  before_validation :get_data_from_reservation


  def arrival
    placements.first.arrival
  end

  def departure
    placements.last.arrival
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
end
