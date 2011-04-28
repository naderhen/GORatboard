class Addbstopredictions < ActiveRecord::Migration
  def self.up
    add_column :predictions, :sword100h, :float
    add_column :predictions, :sword100l, :float
    add_column :predictions, :sword7099h, :float
    add_column :predictions, :sword7099l, :float
    add_column :predictions, :snap34h, :float
    add_column :predictions, :snap34l, :float
    add_column :predictions, :snap12h, :float
    add_column :predictions, :snap12l, :float
    add_column :predictions, :snap24h, :float
    add_column :predictions, :snap24l, :float
    add_column :predictions, :snap6h, :float
    add_column :predictions, :snap6l, :float
    add_column :predictions, :bline12h, :float
    add_column :predictions, :bline12l, :float
    add_column :predictions, :lane12h, :float
    add_column :predictions, :lane12l, :float
    add_column :predictions, :lane24h, :float
    add_column :predictions, :lane24l, :float
    add_column :predictions, :mahi1015h, :float
    add_column :predictions, :mahi1015l, :float
    add_column :predictions, :mahi1520h, :float
    add_column :predictions, :mahi1520l, :float
    add_column :predictions, :mahi20h, :float
    add_column :predictions, :mahi20l, :float
  end

  def self.down
    remove_column :predictions, :sword100h
    remove_column :predictions, :sword100l
    remove_column :predictions, :sword7099h
    remove_column :predictions, :sword7099l
    remove_column :predictions, :snap34h
    remove_column :predictions, :snap34l
    remove_column :predictions, :snap12h
    remove_column :predictions, :snap12l
    remove_column :predictions, :snap24h
    remove_column :predictions, :snap24l
    remove_column :predictions, :snap6h
    remove_column :predictions, :snap6l
    remove_column :predictions, :bline12h
    remove_column :predictions, :bline12l
    remove_column :predictions, :lane12h
    remove_column :predictions, :lane12l
    remove_column :predictions, :lane24h
    remove_column :predictions, :lane24l
    remove_column :predictions, :mahi1015h
    remove_column :predictions, :mahi1015l
    remove_column :predictions, :mahi1520h
    remove_column :predictions, :mahi1520l
    remove_column :predictions, :mahi20h
    remove_column :predictions, :mahi20l
  end
end