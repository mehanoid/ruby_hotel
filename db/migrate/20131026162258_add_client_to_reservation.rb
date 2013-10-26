class AddClientToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :client, index: true
  end
end
