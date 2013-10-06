module Admin
  class ReservationsController < AdminController

    before_action :reservation_for_create, only: [:create]

    load_and_authorize_resource


    def new
      @reservation.room_category_id = params[:room_category_id]
    end

    def create
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to @reservation, notice: 'Номер забронирован.' }
          format.json { render action: 'show', status: :created, location: @reservation }
        else
          format.html { render action: 'new' }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    end

    ## PATCH/PUT /reservations/1
    ## PATCH/PUT /reservations/1.json
    #def update
    #  respond_to do |format|
    #    if @reservation.update(reservation_params)
    #      format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
    #      format.json { head :no_content }
    #    else
    #      format.html { render action: 'edit' }
    #      format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
    #
    ## DELETE /reservations/1
    ## DELETE /reservations/1.json
    #def destroy
    #  @reservation.destroy
    #  respond_to do |format|
    #    format.html { redirect_to reservations_url }
    #    format.json { head :no_content }
    #  end
    #end

    private

    def reservation_for_create
      @reservation = Reservation.new(reservation_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:room_category_id, :arrival, :departure)
    end
  end
end