class AddRoomCategoryToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :room_category, index: true
  end
end