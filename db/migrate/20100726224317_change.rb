class Change < ActiveRecord::Migration
  def self.up
    rename_column :reports, :shipper_id, :user_id 
  end

  def self.down
    rename_column :reports, :user_id, :shipper_id 
  end
end
