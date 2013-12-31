class Accommodation < ActiveRecord::Base
  include Concerns::NestedClientBuilder

  belongs_to :client
  has_many :placements, inverse_of: :accommodation, dependent: :destroy

  accepts_nested_attributes_for :client, :placements

  validates :client, :placements, presence: true

  before_create :cancel_reservation

  # Дата заселения равна дате заселения, указанной в первом размещении
  def arrival
    placements.first.arrival
  end

  # Дата выселения равна дате выселения, указанной в последнем размещении
  def departure
    placements.last.departure
  end

  # Возвращает стоимость заселения, которая расчитывается
  # как сумма стоимостей отдельных размещений
  def cost
    placements.sum(:cost)
  end

  # Возвращает текущий занятый номер
  def room
    placements.last.room
  end

  # Используется для вывода сообщений об ошибках
  def base_errors
    if placements.any?
      errors[:base] + placements.map { |pl| pl.errors[:base] }.sum
    else
      errors[:base]
    end
  end

  # Выполняет выселение
  def finish!
    placements.last.finish!
  end

  # Проверяет, является ли дата заселения сегодняшним числом
  def ready_for_finish?
    departure <= Date.today
  end

  def client_attributes=(attributes)
    @client_attributes = attributes
    self.client ||= Client.new
    client.assign_attributes(attributes)
  end

  # При получении номера брони создаёт из этой брони размещение
  def reservation_id=(id)
    @reservation_id = id
    return unless id
    @reservation = Reservation.find(id)
    placements.build(reservation: @reservation)
    self.client = @reservation.client
    client.assign_attributes(@client_attributes)
  end

  def all_placements
    placements.unscoped
  end

  attr_reader :reservation_id

  # Выполняет валидацию, что при заселении все данные о клиенте должны быть обязательно введены
  before_validation do |accommodation|
    accommodation.client.all_data_should_be_present = true if accommodation.client
  end

  # Определяет активные заселения
  scope :active, -> { joins(:placements).where { placements.finished == false }.distinct }

  default_scope { active }

  private

  # При выполнении заселения мы отменяем только что использованную бронь
  def cancel_reservation
    @reservation.try(:cancel)
  end

end
