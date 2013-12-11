class Room < ActiveRecord::Base
  belongs_to :category, class_name: 'RoomCategory'
  has_many :placements, dependent: :nullify

  validates :number, uniqueness: true, numericality: { only_integer: true }
  validates :number, :category, presence: true

end
