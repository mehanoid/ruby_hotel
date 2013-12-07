class AddCostToPlacement < ActiveRecord::Migration
  def change
    add_column :placements, :cost, :integer
  end
end
