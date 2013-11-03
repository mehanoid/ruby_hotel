class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  def available_arrival_dates(range_length: 2.months)
    (Date.today ... Date.today + range_length).select { |date| free_rooms(date, date + 1.day).any? }
  end

  def available_departure_dates(arrival: Date.today, range_length: 2.months)
    (arrival + 1.day .. Date.today + range_length).select { |date| free_rooms(arrival, date).any? }
  end

  def free_room(arrival, departure)
    free_rooms(arrival, departure).first
  end

  def free_rooms(arrival, departure)
    rooms.where { |q|
      (q.id.not_in reserved_rooms(arrival, departure).select(:id)) &
      (q.id.not_in occupied_rooms(arrival, departure).select(:id))
    }
  end

  def reserved_rooms(arrival, departure)
    rooms.joins(:reservations).merge(Reservation.overlapping_with(arrival, departure))
  end

  def occupied_rooms(arrival, departure)
    rooms.joins(:placements).merge(Placement.overlapping_with(arrival, departure))
  end
end
