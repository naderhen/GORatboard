class AddBoardIdToRatgrades < ActiveRecord::Migration
  def self.up
    add_column :ratgrades, :board_id, :integer
  end

  def self.down
    remove_column :ratgrades, :board_id
  end
end