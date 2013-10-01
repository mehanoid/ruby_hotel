class HomeController < ApplicationController
  def show
  end

  def rooms
    @room_categories = RoomCategory.all
  end
end
