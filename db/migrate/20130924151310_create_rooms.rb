class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.references :category, index: true

      t.timestamps
    end
  end
end
