class AddNewIdsToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :warehouse_id, :integer
    add_column :sales, :board_id, :integer
  end

  def self.down
    remove_column :sales, :warehouse_id
    remove_column :sales, :board_id
  end
end
