class Placement < ActiveRecord::Base
  include Concerns::ArrivalDeparture

  belongs_to :room
  belongs_to :accommodation, inverse_of: :placements

  validates :room_category_id, presence: true, unless: :room_id?

  attr_accessor :room_category_id

  before_validation do |placement|
    if !placement.room && room_category_id.present?
      category = RoomCategory.find(room_category_id)
      unless (placement.room = category.free_room(arrival, departure))
        errors[:base] << 'Нет свободных номеров за выбранный период'
      end
    end
  end
end
