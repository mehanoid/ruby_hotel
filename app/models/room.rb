class Room < ActiveRecord::Base
  belongs_to :category, class_name: 'RoomCategory'
  has_many :reservations, dependent: :nullify

  validates :number, uniqueness: true
  validates :number, :category, presence: true
end
