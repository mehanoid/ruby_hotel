class AddClientToAccommodation < ActiveRecord::Migration
  def change
    add_reference :accommodations, :client, index: true
  end
end
