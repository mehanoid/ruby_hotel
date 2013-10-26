class AddNameIndexToRoomCategory < ActiveRecord::Migration
  def change
    add_index :room_categories, :name, unique: true
  end
end
