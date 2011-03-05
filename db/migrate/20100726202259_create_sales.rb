class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :amount
      t.integer :ratgrade_id
      t.integer :user_id
      t.integer :customer_id
      t.boolean :allocated

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
