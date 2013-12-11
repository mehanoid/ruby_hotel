class AddDocumentTypeToPassports < ActiveRecord::Migration
  def change
    add_column :passports, :document_type, :string
  end
end
