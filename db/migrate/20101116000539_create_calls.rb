class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.integer :user_id
      t.integer :customer_id
      t.datetime :call_time
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
