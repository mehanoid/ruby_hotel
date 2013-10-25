class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.references :contact_information, index: true

      t.timestamps
    end
  end
end
