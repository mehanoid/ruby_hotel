class RoomCategory < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :rooms, foreign_key: :category_id, inverse_of: :category, dependent: :destroy

  def find_free_room(arrival, departure)
    rooms.first
  end
end
