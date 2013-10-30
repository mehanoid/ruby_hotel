class ReservationsController < InheritedResources::Base
  include Concerns::ReservationParams

  def new
    @reservation = Reservation.new
    @reservation.build_client_data
    @reservation.room_category_id = params[:room_category_id]
  end
end
