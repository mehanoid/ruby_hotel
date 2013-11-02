class RoomCategoriesController < ApplicationController
  inherit_resources
  respond_to :html, only: %i[index]
  respond_to :json, only: %i[available_arrival_dates]

  def available_arrival_dates
    render json: RoomCategory.find(params[:id]).available_arrival_dates
  end
end
