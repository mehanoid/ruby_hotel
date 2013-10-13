class RoomsForm
  include ActiveAttr::Model

  attribute :number_range_start, type: Integer
  attribute :number_range_end, type: Integer
  attribute :category_id, type: Integer

  validates :number_range_start, :number_range_end, presence: true
  validates :number_range_start, numericality: {
      only_integer: true,
      greater_than: 0
  }
  validates :number_range_end, numericality: {
      only_integer: true,
      greater_than_or_equal_to: :number_range_start,
      message: 'Конец диапазона должен быть больше начала'
  }
  validate :rooms_uniqueness


  def save
    if valid?
      numbers_range.each do |number|
        Room.create! number: number, category_id: category_id
      end
    end
  end

  def numbers_range
    number_range_start..number_range_end if number_range_start and number_range_end
  end

  private

  def rooms_uniqueness
    return unless numbers_range
    existing_rooms = Room.where(category_id: category_id, number: numbers_range)
    if existing_rooms.any?
      numbers = existing_rooms.pluck(:number).to_sentence
      errors[:base] << (existing_rooms.many? ? "Номера #{numbers} уже существуют" : "Номер #{numbers} уже существует")
    end
  end
end
