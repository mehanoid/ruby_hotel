module Admin
  class RoomsController < AdminController
    before_action :set_room, only: [:show, :edit, :update, :destroy]
    before_action :set_category, only: [:new, :create]

    # GET /rooms
    # GET /rooms.json
    def index
      @rooms = Room.all
    end

    ## GET /rooms/1
    ## GET /rooms/1.json
    def show
    end

    # GET /rooms/new
    def new
      @category = RoomCategory.find(params[:room_category_id])
      @room = Room.new
    end

    # GET /rooms/1/edit
    def edit
    end

    # POST /rooms
    # POST /rooms.json
    def create
      @room = @category.rooms.build(room_params)

      respond_to do |format|
        if @room.save
          format.html { redirect_to [:admin, @room], notice: 'Номер сохранён' }
          format.json { render action: 'show', status: :created, location: @room }
        else
          format.html { render action: 'new' }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /rooms/1
    # PATCH/PUT /rooms/1.json
    def update
      respond_to do |format|
        if @room.update(room_params)
          format.html { redirect_to [:admin, @room], notice: 'Room was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /rooms/1
    # DELETE /rooms/1.json
    def destroy
      @room.destroy
      respond_to do |format|
        format.html { redirect_to admin_rooms_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def set_category
      @category = RoomCategory.find(params[:room_category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:number, :category_id)
    end

  end
end