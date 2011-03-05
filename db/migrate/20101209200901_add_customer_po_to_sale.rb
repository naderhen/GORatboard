class AddCustomerPoToSale < ActiveRecord::Migration
  def self.up
    add_column :sales, :customer_po, :string
  end

  def self.down
    remove_column :sales, :customer_po
  end
end