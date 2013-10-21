class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  def free_room(arrival, departure)
    reserved_rooms = rooms.joins(:reservations).merge(Reservation.overlapping_with(arrival, departure))
    occupied_rooms = rooms.joins(:placements).merge(Placement.overlapping_with(arrival, departure))
    rooms.where {
      (id.not_in reserved_rooms.select(:id)) &
      (id.not_in occupied_rooms.select(:id))
    }.first
  end
end
