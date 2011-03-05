class CreateWarehouses < ActiveRecord::Migration
  def self.up
    create_table :warehouses do |t|
      t.integer :board_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :warehouses
  end
end
