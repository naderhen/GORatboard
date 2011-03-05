class DropPNotesTable < ActiveRecord::Migration
  def self.up
    drop_table :pnotes
  end

  def self.down
  end
end
