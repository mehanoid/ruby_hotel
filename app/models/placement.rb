class Placement < ActiveRecord::Base
  include Concerns::ArrivalDeparture

  belongs_to :room
  belongs_to :accommodation, inverse_of: :placements

  attr_accessor :room_category_id
  attr_accessor :reservation

  validates :room_category_id, presence: true, unless: :room_id?

  before_validation :set_room_from_room_category, :set_arrival, :set_data_from_reservation, on: :create
  before_save :set_cost

  scope :active, -> { where finished: false }

  default_scope { active }

  # Выполняет выселение
  def finish!
    self.finished = true
    save
  end

  private

  # Устанавливает данные для размещения с использованием брони
  def set_data_from_reservation
    if reservation
      self.departure = reservation.departure
      self.room = reservation.reserved_room
    end
  end

  # Вычисляет и сохраняет стоимость проживания
  def set_cost
    self.cost = (departure - arrival) * room.category.price if arrival && departure && room
  end

  # Устанавливает в качестве даты заселения сегодняшнее число
  def set_arrival
    self.arrival = Date.today
  end

  # Используется в случае заселения без предварительной брони.
  # Берёт первый номер из числа свободных номеров, если такие имеются
  def set_room_from_room_category
    if room_category_id.present?
      category = RoomCategory.find(room_category_id)
      unless self.room = category.free_room(arrival, departure)
        errors[:base] << 'Нет свободных номеров за выбранный период'
      end
    end
  end
end
