module Admin
  class AccommodationsController < AdminController
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    def index
      @accommodations = @accommodations.includes(:placements)
    end

    private
    def permitted_params
      params.permit(accommodation: [:reservation_id, placements_attributes: %i[arrival departure room_id]])
    end
  end
end