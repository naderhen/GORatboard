class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :category_id
      t.string :name
      t.float :price
      t.string :description
      t.integer :trend

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
