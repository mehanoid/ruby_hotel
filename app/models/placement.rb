class Placement < ActiveRecord::Base
  include Concerns::ArrivalDeparture

  belongs_to :room
  belongs_to :accommodation, inverse_of: :placements

end
