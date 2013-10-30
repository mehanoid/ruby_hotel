module Admin
  class ReservationsController < AdminController
    include Concerns::ReservationParams
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    def cancel
      @reservation.cancel
      respond_to do |format|
        format.html { redirect_to admin_reservations_url, notice: 'Бронь аннулирована' }
      end
    end
  end
end