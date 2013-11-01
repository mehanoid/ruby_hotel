class RenameBirsdayToBirthdayInClients < ActiveRecord::Migration
  def change
    rename_column :clients, :birsday, :birthday
  end
end
