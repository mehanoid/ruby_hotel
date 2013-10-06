module Admin
  class RoomsController < AdminController
    before_action :set_category, only: [:new, :create]
    before_action :room_for_create, only: [:create]

    load_and_authorize_resource


    def create
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

    def destroy
      @room.destroy
      respond_to do |format|
        format.html { redirect_to admin_rooms_url }
        format.json { head :no_content }
      end
    end

    private

    def set_category
      @category = RoomCategory.find(params[:room_category_id])
    end

    def room_for_create
      @room = @category.rooms.build(room_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:number, :category_id)
    end

  end
end