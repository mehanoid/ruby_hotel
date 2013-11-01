class ReservationsController < ApplicationController
  include Concerns::ClientAttributes
  inherit_resources
  respond_to :html

  def new
    @reservation = Reservation.new
    @reservation.build_client_data
    @reservation.room_category_id = params[:room_category_id]
  end

  private
  def permitted_params
    params.permit(reservation: [
        :room_category_id,
        :arrival,
        :departure,
        client_attributes: client_attributes
    ])
  end
end
