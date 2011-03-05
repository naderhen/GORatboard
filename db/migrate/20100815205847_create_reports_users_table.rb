class CreateReportsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :reports_users, :id=>false do |t|
      t.references :report
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :reports_users
  end
end
