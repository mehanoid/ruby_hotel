class AddIndexToRoomOnNumber < ActiveRecord::Migration
  def change
    add_index :rooms, :number
  end
end
