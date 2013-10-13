class RoomsForm
  include ActiveModel::Model

  validates :number_range_start, :number_range_end, numericality: {only_integer: true}

  attr_accessor :number_range_start, :number_range_end, :category_id

  def save
    if valid?
      (number_range_start..number_range_end).each do |number|
        Room.create! number: number, category_id: category_id
        @persisted = true
      end
    end
  end
end
