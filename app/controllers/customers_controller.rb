class CustomersController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  
  helper_method :sort_column, :sort_direction
  
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => customers_per_page, :page => params[:page])

    respond_to do |format|
      format.html
      format.js   { render :json=> @customers }
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
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
  
  def delete_bad
    @customers = Customer.prospects + Customer.shippers + Customer.personals
    @customers.each do |customer|
      customer.destroy
    end
    
    redirect_to :action=>:index
  end
  
  
  private 
    def customers_per_page 
      if params[:per_page] 
        session[:customers_per_page] = params[:per_page] 
      end 
      session[:customers_per_page] 
    end
  
end
