class AddOverSaleToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :oversale, :boolean
  end

  def self.down
    remove_column :sales, :oversale
  end
end