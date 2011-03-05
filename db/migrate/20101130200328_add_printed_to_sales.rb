class AddPrintedToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :printed, :boolean, :default=> false
  end

  def self.down
    remove_column :sales, :printed
  end
end