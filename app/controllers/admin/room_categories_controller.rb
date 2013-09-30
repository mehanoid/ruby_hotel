module Admin
  class RoomCategoriesController < AdminController
    before_action :set_room_category, only: [:show, :edit, :update, :destroy]

    # GET /room_categories
    # GET /room_categories.json
    def index
      @room_categories = RoomCategory.all
    end

    # GET /room_categories/1
    # GET /room_categories/1.json
    def show
    end

    # GET /room_categories/new
    def new
      @room_category = RoomCategory.new
    end

    # GET /room_categories/1/edit
    def edit
    end

    # POST /room_categories
    # POST /room_categories.json
    def create
      @room_category = RoomCategory.new(room_category_params)

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

    # PATCH/PUT /room_categories/1
    # PATCH/PUT /room_categories/1.json
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

    # DELETE /room_categories/1
    # DELETE /room_categories/1.json
    def destroy
      @room_category.destroy
      respond_to do |format|
        format.html { redirect_to admin_room_categories_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_category
      @room_category = RoomCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_category_params
      params.require(:room_category).permit(:name, :description)
    end
  end
end