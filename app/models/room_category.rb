class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy
  has_many :reservations, dependent: :nullify

  # Возвращает список дат, доступных для заезда
  def available_arrival_dates(range_length: 2.months)
    range = Date.today .. Date.today + range_length - 1.day
    reservations_and_placements = reservations_and_placements_for_range(range)

    available_dates = range.select do |date|
      rooms.count > reservations_and_placements.count { |r| r.overlaps_with?(date, date.next_day) }
    end
    [available_dates, range]
  end

  # Возвращает список дат, доступных для выезда
  def available_departure_dates(arrival: Date.today, range_length: 2.months)
    range_start = Date.today
    range_end = Date.today + range_length
    unless arrival.in? range_start..range_end
      return [[], nil]
    end
    range = arrival + 1.day .. range_end
    reservations_and_placements = reservations_and_placements_for_range(range)

    available_dates = range.select do |date|
      rooms.count > reservations_and_placements.count { |r| r.overlaps_with?(arrival, date) }
    end
    [available_dates, range]
  end

  # Возвращает первый свободный номер на указанном периоде
  def free_room(arrival, departure)
    free_rooms(arrival, departure).first
  end

  # Возвращает первый номер из списка забронированных
  # или свободных номеров на указанном периоде
  def reserved_room(arrival, departure)
    not_occupied_rooms(arrival, departure).first
  end

  # Проверяет, есть ли хотя бы один свободный номер
  # на указанном периоде
  def free_rooms?(arrival, departure)
    free_rooms(arrival, departure).any?
  end

  def to_s
    name
  end

  private

  # Возвращает список номеров, доступных для бронирования или заселения
  def free_rooms(arrival, departure)
    n_o_rooms = not_occupied_rooms arrival, departure
    if n_o_rooms.count > reservations.overlapping_with(arrival, departure).count
      n_o_rooms
    else
      Room.none
    end
  end

  # Возвращает список номеров, в которых уже кто-то проживает
  def occupied_rooms(arrival, departure)
    rooms.joins(:placements).merge(Placement.overlapping_with(arrival, departure))
  end

  # Возвращает список номеров, в которых никто не проживает
  def not_occupied_rooms(arrival, departure)
    rooms.where.not(id: occupied_rooms(arrival, departure))
  end

  # Возвращяет массив, содержащий и брони, и размещения, период проживания у которых
  # пересекается с указанным периодом
  def reservations_and_placements_for_range(range)
    Placement.overlapping_with(range.begin, range.end).joins(:room).merge(rooms) +
        reservations.overlapping_with(range.begin, range.end)
  end
end
