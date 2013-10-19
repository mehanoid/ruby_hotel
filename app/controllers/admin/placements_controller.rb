module Admin
  class PlacementsController < AdminController
    before_action :set_placement, only: [:show, :edit, :update, :destroy]

    load_and_authorize_resource

    # GET /placements
    # GET /placements.json
    def index
      @placements = Placement.all
    end

    # GET /placements/1
    # GET /placements/1.json
    def show
    end

    # GET /placements/new
    def new
      @placement = Placement.new
    end

    # GET /placements/1/edit
    def edit
    end

    # POST /placements
    # POST /placements.json
    def create
      @placement = Placement.new(placement_params)

      respond_to do |format|
        if @placement.save
          format.html { redirect_to @placement, notice: 'Placement was successfully created.' }
          format.json { render action: 'show', status: :created, location: @placement }
        else
          format.html { render action: 'new' }
          format.json { render json: @placement.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /placements/1
    # PATCH/PUT /placements/1.json
    def update
      respond_to do |format|
        if @placement.update(placement_params)
          format.html { redirect_to @placement, notice: 'Placement was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @placement.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /placements/1
    # DELETE /placements/1.json
    def destroy
      @placement.destroy
      respond_to do |format|
        format.html { redirect_to placements_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_placement
      @placement = Placement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def placement_params
      params.require(:placement).permit(:room_id, :arrival, :departure, :accommodation_id)
    end
  end
end