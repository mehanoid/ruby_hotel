class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.references :contact_information, index: true

      t.timestamps
    end
  end
end
