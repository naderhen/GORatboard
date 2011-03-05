class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :shipper_id
      t.date :report_date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
