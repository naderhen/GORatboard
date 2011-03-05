class AddDatesToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :invoice_date, :date
    add_column :sales, :receive_date, :date
  end

  def self.down
    remove_column :sales, :invoice_date
    remove_column :sales, :receive_date
  end
end