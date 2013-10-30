module Admin
  class ReservationsController < AdminController
    include Concerns::ClientAttributes
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    def cancel
      @reservation.cancel
      respond_to do |format|
        format.html { redirect_to admin_reservations_url, notice: 'Бронь аннулирована' }
      end
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
end