class Accommodation < ActiveRecord::Base
  include Concerns::NestedClientBuilder

  belongs_to :client, validate: true
  has_many :placements, inverse_of: :accommodation, dependent: :destroy

  accepts_nested_attributes_for :placements
  attr_writer :client_attributes
  attr_reader :reservation_id

  validates :client, :placements, presence: true

  before_create :cancel_reservation
  before_validation :set_data

  # Дата заселения, равная дате заселения, указанной в первом размещении
  def arrival
    placements.first.arrival
  end

  # Дата выселения, равная дате выселения, указанной в последнем размещении
  def departure
    placements.last.departure
  end

  # Возвращает стоимость заселения, которая расчитывается
  # как сумма стоимостей отдельных размещений
  def cost
    placements.sum(:cost)
  end

  # Текущий занятый номер
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

  # Проверяет, истёк ли срок проживания
  def expired?
    departure <= Date.today
  end

  # Находит и запоминает использованную бронь
  def reservation_id=(id)
    @reservation_id = id
    return unless id
    @reservation = Reservation.find(id)
  end

  def all_placements
    placements.unscoped
  end

  # Активные заселения
  scope :active, -> { joins(:placements).where(placements: {finished: false}).distinct }

  default_scope { active }

  private

  def set_data
    # Получение данных для размещения из брони
    if @reservation
      placements.build(reservation: @reservation)
      self.client = @reservation.client
    else
      build_client unless client
    end

    # Установка данных клиента
    client.assign_attributes(@client_attributes) if @client_attributes
    client.full_validation = true
  end

  # При выполнении заселения мы отменяем только что использованную бронь
  def cancel_reservation
    @reservation.try(:cancel)
  end

end
