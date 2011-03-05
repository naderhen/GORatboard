#require 'fastercsv'
require 'fastercsv'
class CsvController < ApplicationController
  before_filter :require_staff
  
  def existing
  end
  
  
  def customer_import
        file = params[:customer_import][:file]
          FasterCSV.foreach(file) do |row|
            if Customer.find_by_name(row[0])
              @customer=Customer.find_by_name(row[0])
              @customer.update_attributes(:address1=>row[1], :address2=>row[2], :city=>row[3], :state=>row[4], :zip=>row[5], :country=>row[6], :email=>row[7], :phone=>row[8], :fax=>row[9], :client_type=>row[10], :euler=>row[11], :contact=>row[12])   
            else 
              Customer.create(:name=>row[0], :address1=>row[1], :address2=>row[2], :city=>row[3], :state=>row[4], :zip=>row[5], :country=>row[6], :email=>row[7], :phone=>row[8], :fax=>row[9], :client_type=>row[10], :euler=>row[11], :contact=>row[12], :created_at=>Time.now,:updated_at=>Time.now)
            end
          end
        flash[:notice] = "Successfully Updated some Customer(s)."
        redirect_to :action => :index
      rescue => exception
        # If an exception is thrown, the transaction rolls back and we end up in this rescue block
        error = ERB::Util.h(exception.to_s) # get the error and HTML escape it
        flash[:error] = "Error adding logs.  (some #{error}).  Please try again."
        redirect_to :action => :index
  end
  
  
  def import
  end

  def upload
    
    if params[:upload][:customer_existing]
    
      FasterCSV.parse(params[:upload][:csv]) do |row|
          if Customer.find_by_name(row[0])
            @customer=Customer.find_by_name(row[0])
            @customer.update_attributes(:address1=>row[1], :address2=>row[2], :city=>row[3], :state=>row[4], :zip=>row[5], :country=>row[6], :email=>row[7], :phone=>row[8], :fax=>row[9], :client_type=>row[10], :euler=>row[11], :contact=>row[12])   
          else 
            Customer.create(:name=>row[0], :address1=>row[1], :address2=>row[2], :city=>row[3], :state=>row[4], :zip=>row[5], :country=>row[6], :email=>row[7], :phone=>row[8], :fax=>row[9], :client_type=>row[10], :euler=>row[11], :contact=>row[12], :created_at=>Time.now,:updated_at=>Time.now)
          end
        end
      flash[:notice] = "Successfully Updated some Customer(s)."
      redirect_to customers_path
   
    
    
    else
      
      table = ImportTable.new :original_path => params[:upload][:csv].original_path
      row_index = 0
      FasterCSV.parse(params[:upload][:csv]) do |cells|
        column_index = 0
        cells.each do |cell|
          table.import_cells.build :column_index => column_index, :row_index => row_index, :contents => cell
          column_index += 1
        end
        row_index += 1
      end
      table.save
      redirect_to import_table_path(table)
      
    end
    
  end

  
end
