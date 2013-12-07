class Placement < ActiveRecord::Base
  include Concerns::ArrivalDeparture

  belongs_to :room
  belongs_to :accommodation, inverse_of: :placements

  validates :room_category_id, presence: true, unless: :room_id?
  validate :arrival_date_is_today, on: :create

  attr_accessor :room_category_id

  before_validation do |placement|
    if !placement.room && room_category_id.present?
      category = RoomCategory.find(room_category_id)
      unless (placement.room = category.free_room(arrival, departure))
        errors[:base] << 'Нет свободных номеров за выбранный период'
      end
    end
  end

  before_validation :set_cost

  scope :active, -> { where finished: false }

  default_scope { active }

  def finish!
    self.finished = true
    save
  end

  private
  def arrival_date_is_today
    if arrival && !arrival.today?
      errors[:arrival] << "Дата заезда должна быть сегодняшним числом, а не #{arrival}"
    end
  end

  def set_cost
    self.cost = (departure - arrival) * room.category.price
  end
end
