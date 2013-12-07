module Admin
  class RoomCategoriesController < AdminController
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    private

    def permitted_params
      params.permit(room_category: [:name, :description, :price])
    end
  end
end