class ReservationsController < ApplicationController
  inherit_resources
  respond_to :html

  include Concerns::ClientAttributes
  include Concerns::ReservationActions

end
