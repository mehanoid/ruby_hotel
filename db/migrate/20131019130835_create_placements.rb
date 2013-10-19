class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.references :room, index: true
      t.date :arrival
      t.date :departure
      t.references :accommodation, index: true

      t.timestamps
    end
  end
end
