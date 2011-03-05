class AddColumnsToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :address1, :string
    add_column :customers, :address2, :string
    add_column :customers, :city, :string
    add_column :customers, :state, :string
    add_column :customers, :zip, :string
    add_column :customers, :country, :string
    add_column :customers, :email, :string
    add_column :customers, :phone, :string
    add_column :customers, :fax, :string
    add_column :customers, :client_type, :string
    add_column :customers, :euler, :string
    add_column :customers, :contact, :string
  end

  def self.down
    remove_column :customers, :address1
    remove_column :customers, :address2
    remove_column :customers, :city
    remove_column :customers, :state
    remove_column :customers, :zip
    remove_column :customers, :country
    remove_column :customers, :email
    remove_column :customers, :phone
    remove_column :customers, :fax
    remove_column :customers, :client_type
    remove_column :customers, :euler
    remove_column :customers, :contact
  end
end