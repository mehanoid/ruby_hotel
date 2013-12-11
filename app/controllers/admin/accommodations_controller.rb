module Admin
  class AccommodationsController < AdminController
    include Concerns::ClientAttributes
    inherit_resources
    respond_to :html
    load_and_authorize_resource

    def index
      @q = Accommodation.search(params[:q])
      @accommodations = @q.result(distinct: true).includes(:placements)
    end

    def new
      if params[:reservation_id]
        @accommodation.reservation_id = params[:reservation_id]
        @accommodation.build_client_data
        render 'new_from_reservation'
      else
        @accommodation.build_client_data
        @accommodation.placements.build
      end
    end

    def create
      create! do |success, failure|
        failure.html do
          @accommodation.build_client_data
          if @accommodation.reservation_id
            render 'new_from_reservation'
          else
            render 'new'
          end
        end
      end
    end

    def finish
      @accommodation.finish!
      respond_with @accommodation do |format|
        format.html { redirect_to admin_accommodations_url }
      end
    end

    private
    def permitted_params
      params.permit(accommodation: [
          :reservation_id,
          placements_attributes: %i[room_category_id departure room_id],
          client_attributes: [
              :first_name,
              :last_name,
              :middle_name,
              :birthday,
              {
                  contact_information_attributes: [
                      {
                          emails_attributes: [:address],
                          phones_attributes: [:number]
                      }
                  ],
                  passport_attributes: [
                      :document_type,
                      :number,
                      :date_of_issue,
                      :issuing_authority
                  ]
              }
          ]
      ])
    end
  end
end