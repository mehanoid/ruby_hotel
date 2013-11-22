class RoomCategoriesController < ApplicationController
  inherit_resources
  respond_to :html, only: %i[index]
  respond_to :json, only: %i[available_arrival_dates available_departure_dates]

  def available_arrival_dates
    dates, range = RoomCategory.find(params[:id]).available_arrival_dates
    render json: {
        range_begin: range.min,
        range_end: range.max,
        available_dates: dates
    }
  end

  def available_departure_dates
    arrival = Date.parse(params[:arrival])
    dates, range = RoomCategory.find(params[:id]).available_departure_dates(arrival: arrival)
    render json: {
        range_begin: range.try(:min),
        range_end: range.try(:max),
        available_dates: dates
    }
  end
end
