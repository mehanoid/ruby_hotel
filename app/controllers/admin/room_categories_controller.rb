module Admin
  class RoomCategoriesController < AdminController
    inherit_resources
    respond_to :html
    load_and_authorize_resource


    #def create
    #  respond_to do |format|
    #    if @room_category.save
    #      format.html { redirect_to [:admin, @room_category], notice: 'Категория сохранена.' }
    #      format.json { render action: 'show', status: :created, location: @room_category }
    #    else
    #      format.html { render action: 'new' }
    #      format.json { render json: @room_category.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
    #
    #def update
    #  respond_to do |format|
    #    if @room_category.update(room_category_params)
    #      format.html { redirect_to [:admin, @room_category], notice: 'Категория обновлена.' }
    #      format.json { head :no_content }
    #    else
    #      format.html { render action: 'edit' }
    #      format.json { render json: @room_category.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
    #

    private

    def permitted_params
      params.permit(room_category: [:name, :description])
    end
  end
end