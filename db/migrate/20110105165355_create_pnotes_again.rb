class CreatePnotesAgain < ActiveRecord::Migration
  def self.up
    create_table :pnotes do |t|
      t.integer :preport_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :pnotes
  end
end
  