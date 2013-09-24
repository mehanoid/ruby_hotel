class Room < ActiveRecord::Base
  validates :number, :category, presence: true

  belongs_to :category, class_name: 'RoomCategory'
end
