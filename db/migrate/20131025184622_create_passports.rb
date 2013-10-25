class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.string :number
      t.date :date_of_issue
      t.string :issuing_authority
      t.references :client, index: true

      t.timestamps
    end
  end
end
