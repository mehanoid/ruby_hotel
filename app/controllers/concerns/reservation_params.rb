module Concerns
  module ReservationParams
    private
    def reservation_params
      params.require(:reservation).permit(
          :room_category_id,
          :arrival,
          :departure,
          client_attributes: [
              :first_name,
              :last_name,
              :middle_name,
              {
                  contact_information_attributes: [
                      {
                          emails_attributes: [:address],
                          phones_attributes: [:number]
                      }
                  ]
              }
          ])
    end
  end
end
