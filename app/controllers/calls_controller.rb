class CallsController < ApplicationController

  def index
    @calls = Call.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calls }
    end
  end


  def show
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @call }
    end
  end


  def new
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @call }
    end
  end


  def edit
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.find(params[:id])
  end


  def create
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.build(params[:call])

    respond_to do |format|
      if @call.save
        format.html { redirect_to(@customer, :notice => 'Call was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @call }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @call.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to(@customer, :notice => 'Call was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @call.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @customer = Customer.find(params[:customer_id])
    @call = @customer.calls.find(params[:id])
    
    @call.destroy

    respond_to do |format|
      format.html { redirect_to(@customer) }
      format.xml  { head :ok }
    end
  end
end
