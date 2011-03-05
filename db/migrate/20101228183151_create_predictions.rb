class CreatePredictions < ActiveRecord::Migration
  def self.up
    create_table :predictions do |t|
      t.integer :preport_id
      t.integer :user_id
      t.float :aplushigh
      t.float :apluslow
      t.float :ahigh
      t.float :alow
      t.float :aminushigh
      t.float :aminuslow
      t.float :bplusplushigh
      t.float :bpluspluslow
      t.float :twohhigh
      t.float :twohlow
      t.float :bhigh
      t.float :blow

      t.timestamps
    end
  end

  def self.down
    drop_table :predictions
  end
end
