class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birsday

      t.timestamps
    end
  end
end
