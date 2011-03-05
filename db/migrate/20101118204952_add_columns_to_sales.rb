class AddColumnsToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :size_pref, :string
    add_column :sales, :cotefr, :string
  end

  def self.down
    remove_column :sales, :size_pref
    remove_column :sales, :cotefr
  end
end