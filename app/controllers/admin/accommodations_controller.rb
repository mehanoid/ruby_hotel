module Admin
  class AccommodationsController < AdminController
    include Concerns::ClientAttributes
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    def index
      @accommodations = @accommodations.includes(:placements)
    end

    def new
      @accommodation.build_client_data
      @accommodation.placements.build
    end

    private
    def permitted_params
      params.permit(accommodation: [
          :reservation_id,
          placements_attributes: %i[room_category_id arrival departure room_id],
          client_attributes: client_attributes
      ])
    end
  end
end