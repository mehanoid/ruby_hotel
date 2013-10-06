module Admin
  class RoomCategoriesController < AdminController
    before_action :room_category_for_create, only: [:create]

    load_and_authorize_resource


    def create
      respond_to do |format|
        if @room_category.save
          format.html { redirect_to [:admin, @room_category], notice: 'Категория сохранена.' }
          format.json { render action: 'show', status: :created, location: @room_category }
        else
          format.html { render action: 'new' }
          format.json { render json: @room_category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @room_category.update(room_category_params)
          format.html { redirect_to [:admin, @room_category], notice: 'Категория обновлена.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @room_category.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @room_category.destroy
      respond_to do |format|
        format.html { redirect_to admin_room_categories_url }
        format.json { head :no_content }
      end
    end

    private

    def room_category_for_create
      @room_category = RoomCategory.new(room_category_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_category_params
      params.require(:room_category).permit(:name, :description)
    end
  end
end