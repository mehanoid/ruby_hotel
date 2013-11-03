class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  def available_arrival_dates(range_length: 2.months)
    range = Date.today ... Date.today + range_length
    reservations_and_placements = reservations_and_placements_for_range(range)

    range.select do |date|
      reservations_and_placements.none? { |r| r.overlaps_with?(date, date + 1.day) }
    end
  end

  def available_departure_dates(arrival: Date.today, range_length: 2.months)
    range = arrival + 1.day .. Date.today + range_length + 1.day
    reservations_and_placements = reservations_and_placements_for_range(range)

    range.select do |date|
      reservations_and_placements.none? { |r| r.overlaps_with?(arrival, date) }
    end
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

  private

  def reservations_and_placements_for_range(range)
    Reservation.overlapping_with(range.min, range.max).joins(:room).where { |q| q.room.category_id == id } +
        Placement.overlapping_with(range.min, range.max).joins(:room).where { |q| q.room.category_id == id }
  end
end
