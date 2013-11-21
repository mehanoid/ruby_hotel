module Concerns
  module ReservationActions
    extend ActiveSupport::Concern
    include Concerns::ClientAttributes

    def new
      @reservation = Reservation.new
      @reservation.build_client_data
    end

    def create
      create! do |success, failure|
        failure.html do
          @reservation.build_client_data
          render 'new'
        end
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