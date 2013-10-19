class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|

      t.timestamps
    end
  end
end
