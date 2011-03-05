class AddPriceToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :price, :float
  end

  def self.down
    remove_column :sales, :price
  end
end
