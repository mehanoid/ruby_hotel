class HomeController < ApplicationController
  def rooms
    @room_categories = RoomCategory.all
  end
end
