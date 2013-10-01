class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :room, index: true
      t.date :arrival
      t.date :departure

      t.timestamps
    end
  end
end
