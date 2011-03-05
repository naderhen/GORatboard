class CreateRatgrades < ActiveRecord::Migration
  def self.up
    create_table :ratgrades do |t|
      t.integer :warehouse_id
      t.string :name
      t.integer :total
      t.date :availdate

      t.timestamps
    end
  end

  def self.down
    drop_table :ratgrades
  end
end
