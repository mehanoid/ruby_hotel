class Accommodation < ActiveRecord::Base
  include Concerns::NestedClientBuilder

  belongs_to :client
  has_many :placements, inverse_of: :accommodation

  accepts_nested_attributes_for :client, :placements

  validates :client, :placements, presence: true

  before_validation :set_arrival, on: :create
  before_create :cancel_reservation

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

  def client_attributes=(attributes)
    @client_attributes = attributes
    self.client = Client.new(attributes) unless client
    client.assign_attributes(attributes)
  end

  def reservation_id=(id)
    @reservation_id = id
    return unless id
    @reservation = Reservation.find(id)
    placements.build(arrival: @reservation.arrival, departure: @reservation.departure, room: @reservation.room)
    self.client = @reservation.client
    client.assign_attributes(@client_attributes)
  end

  attr_reader :reservation_id

  private

  def cancel_reservation
    @reservation.try(:cancel)
  end

  def set_arrival
    placement = placements.try(:first)
    if placement && !placement.arrival
      placement.arrival = Date.today
    end
  end
end
