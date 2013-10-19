class Placement < ActiveRecord::Base
  belongs_to :room
  belongs_to :accommodation, inverse_of: :placements

end
