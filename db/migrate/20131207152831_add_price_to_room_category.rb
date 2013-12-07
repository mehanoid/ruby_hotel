class AddPriceToRoomCategory < ActiveRecord::Migration
  def change
    add_column :room_categories, :price, :integer
  end
end
