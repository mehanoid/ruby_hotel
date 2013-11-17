class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  def available_arrival_dates(for_reservation: false, range_length: 2.months)
    range_start = for_reservation ? Date.tomorrow : Date.today
    range = range_start .. Date.today + range_length - 1.day
    reservations_and_placements = reservations_and_placements_for_range(range)

    available_dates = range.select do |date|
      reservations_and_placements.none? { |r| r.overlaps_with?(date, date.next_day) }
    end
    [available_dates, range]
  end

  def available_departure_dates(for_reservation: false, arrival: Date.today, range_length: 2.months)
    range_start = for_reservation ? 2.days.from_now.to_date : Date.tomorrow
    range_end = Date.today + range_length
    unless arrival.in? range_start..range_end
      return [[], nil]
    end
    range = arrival .. range_end
    reservations_and_placements = reservations_and_placements_for_range(range)

    available_dates = range.select do |date|
      reservations_and_placements.none? { |r| r.overlaps_with?(arrival, date) }
    end
    [available_dates, range]
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

  def to_s
    name
  end

  private

  def reservations_and_placements_for_range(range)
    [Reservation, Placement].map {|model| model.overlapping_with(range.begin, range.end).joins(:room).merge(rooms) }.sum
  end
end
