class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :attachment_type
      t.integer :customer_id
      t.string :attachment_file_name
      t.integer :attachment_file_size
      t.string :attachment_content_type
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
