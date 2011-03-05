class SalesController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  autocomplete :customer, :name, :full=>true
  autocomplete :ratgrade, :name, :full=>true
  
  # GET /sales
  # GET /sales.xml
  def index
    
    @sales = Sale.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  def show

    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'worksheet'}
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  
  def new
      if params[:ratgrade_id]
        @ratgrade = Ratgrade.find(params[:ratgrade_id])
        @sale = @ratgrade.sales.build
        @customers = Customer.all
      else
        @sale = Sale.new
      end
      
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  


  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  def create
    if params[:ratgrade_id]
      @ratgrade = Ratgrade.find(params[:ratgrade_id])
      @sale = @ratgrade.sales.build(params[:sale])
    else
      @sale = Sale.new(params[:sale])  
    end  
    respond_to do |format|
      if @sale.save
        format.html { redirect_to root_url, :notice => 'Sale was successfully updated.' }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
        format.iphone {redirect_to root_url}
      else
        format.html { redirect_to root_url }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to (root_url, :notice => 'Sale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
  
  

  
  
  
end
