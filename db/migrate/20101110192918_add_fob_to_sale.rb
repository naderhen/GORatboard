class AddFobToSale < ActiveRecord::Migration
  def self.up
    add_column :sales, :fob, :string
    add_column :sales, :notes, :text
    
  end

  def self.down
    remove_column :sales, :fob
    remove_column :sales, :notes
  end
end