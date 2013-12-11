class RemoveRoomFromReservation < ActiveRecord::Migration
  def change
    remove_reference :reservations, :room, index: true
  end
end
