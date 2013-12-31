class Reservation < ActiveRecord::Base
  include Concerns::ArrivalDeparture

  # Подключение модуля, необходимого для ввода данных
  # вложенных ресурсов
  include Concerns::NestedClientBuilder

  belongs_to :room_category
  belongs_to :client

  validates :room_category, :client, presence: true
  validate :there_are_free_rooms, on: :create

  accepts_nested_attributes_for :client

  # Определяет, что активными являются брони, которые не были отменены,
  # и дата заселения у которых не раньше, чем сегодня
  scope :active, -> { where { (canceled == false) & (arrival >= Date.today) } }

  default_scope { active.order(:arrival) }

  def cancel
    self.canceled = true
    save
  end

  def ready_for_accomodation?
    arrival.today?
  end

  # Возвращает номер из забронированной категории номеров
  def reserved_room
    room_category.reserved_room(arrival, departure)
  end

  private

  # Проверяет, что есть номера, доступные для бронирования
  def there_are_free_rooms
    if room_category && !room_category.free_rooms?(arrival, departure)
      errors[:base] << 'Извините, нет свободных номеров за выбранный период'
    end
  end
end
