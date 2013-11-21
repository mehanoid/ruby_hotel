class AddFinishedToPlacement < ActiveRecord::Migration
  def change
    add_column :placements, :finished, :boolean, default: false
  end
end
