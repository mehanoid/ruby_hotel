class Accommodation < ActiveRecord::Base
  include Concerns::NestedClientBuilder

  belongs_to :client
  has_many :placements, inverse_of: :accommodation

  accepts_nested_attributes_for :client, :placements

  validates :client, :placements, presence: true

  before_validation :get_data_from_reservation

  attr_accessor :reservation_id

  def arrival
    placements.first.arrival
  end

  def departure
    placements.last.departure
  end

  def room
    placements.last.room
  end

  def base_errors
    if placements.any?
      errors[:base] + placements.map { |pl| pl.errors[:base] }.sum
    else
      errors[:base]
    end
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
