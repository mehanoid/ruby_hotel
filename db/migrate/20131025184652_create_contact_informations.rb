class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.references :client, index: true

      t.timestamps
    end
  end
end
