module Admin
  class AccommodationsController < ApplicationController
    before_action :set_accommodation_for_create, only: [:create]

    load_and_authorize_resource

    # GET /accommodations
    # GET /accommodations.json
    def index
    end

    # GET /accommodations/1
    # GET /accommodations/1.json
    def show
    end

    # GET /accommodations/new
    def new
    end

    # GET /accommodations/1/edit
    def edit
    end

    # POST /accommodations
    # POST /accommodations.json
    def create
      respond_to do |format|
        if @accommodation.save
          format.html { redirect_to [:admin, @accommodation], notice: 'Accommodation was successfully created.' }
          format.json { render action: 'show', status: :created, location: @accommodation }
        else
          #puts 'errors!!!'
          #p @accommodation.errors.messages
          #puts '@accommodation!!!'
          #p @accommodation
          #puts '@accommodation.placements!!!'
          #p @accommodation.placements
          format.html { render action: 'new' }
          format.json { render json: @accommodation.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /accommodations/1
    # PATCH/PUT /accommodations/1.json
    def update
      respond_to do |format|
        if @accommodation.update(accommodation_params)
          format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @accommodation.errors, status: :unprocessable_entity }
        end
      end
    end

    #def destroy
    #  @accommodation.destroy
    #  respond_to do |format|
    #    format.html { redirect_to accommodations_url }
    #    format.json { head :no_content }
    #  end
    #end

    private
    # Use callbacks to share common setup or constraints between actions.

    def set_accommodation_for_create
      @accommodation = Accommodation.new(accommodation_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_params
      #puts 'params!!!'
      #p params
      params.require(:accommodation).permit(:reservation_id, placements_attributes: %i[arrival departure room_id])
    end
  end
end