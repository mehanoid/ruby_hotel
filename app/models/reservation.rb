class Reservation < ActiveRecord::Base
  include Concerns::ArrivalDeparture
  include Concerns::NestedClientBuilder

  belongs_to :room
  belongs_to :room_category
  belongs_to :client

  validates :room_category, :client, presence: true
  validate :room_not_occupied, on: :create

  accepts_nested_attributes_for :client

  scope :active, -> { where { (canceled == false) & (arrival >= Date.today) } }

  default_scope { active.order(:arrival) }

  def cancel
    self.canceled = true
    save
  end

  def ready_for_accomodation?
    arrival.today?
  end

  def reserved_room
    room_category.reserved_room(arrival, departure)
  end

  private

  def room_not_occupied
    if room_category && !room_category.free_rooms?(arrival, departure)
      errors[:base] << 'Извините, нет свободных номеров за выбранный период'
    end
  end
end
