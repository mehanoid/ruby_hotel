module Admin
  class ReservationsController < AdminController
    inherit_resources
    respond_to :html
    load_and_authorize_resource
    include Concerns::ReservationActions

    def cancel
      @reservation.cancel
      respond_with @reservation do |format|
        format.html { redirect_to admin_reservations_url }
      end
    end
  end
end