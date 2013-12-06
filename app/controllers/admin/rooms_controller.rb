module Admin
  class RoomsController < AdminController
    inherit_resources
    respond_to :html
    belongs_to :room_category, shallow: true
    load_and_authorize_resource

    def new
      @rooms_form = RoomsForm.new
    end

    def create
      @rooms_form = RoomsForm.new room_params
      @rooms_form.category_id = @room_category.id
      respond_to do |format|
        if @rooms_form.save
          format.html { redirect_to [:admin, @room_category], notice: 'Номера добавлены' }
        else
          format.html { render action: 'new' }
        end
      end
    end

    def destroy_multiple
      rooms_for_destroy = params[:rooms_for_destroy]
      notice = nil
      if rooms_for_destroy.present?
        Room.where(category: @room_category).destroy(rooms_for_destroy)
        notice = 'Номера успешно удалены'
      end
      redirect_to :back, notice: notice
    end

    private

    def room_params
      params.require(:rooms_form).permit(:number_range_start, :number_range_end)
    end
  end
end