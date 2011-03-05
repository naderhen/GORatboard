class RemoveUserIdFromReports < ActiveRecord::Migration
  def self.up
    remove_column :reports, :user_id
  end

  def self.down
    add_column :reports, :user_id, :integer
  end
end
