class WarehousesController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
 
  # GET /warehouses
  # GET /warehouses.xml
  def index
    @warehouses = Warehouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouses }
    end
  end

  # GET /warehouses/1
  # GET /warehouses/1.xml
  def show
    @warehouse = Warehouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warehouse }
    end
  end

  # GET /warehouses/new
  # GET /warehouses/new.xml
  def new
    @warehouse = Warehouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warehouse }
    end
  end

  # GET /warehouses/1/edit
  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  # POST /warehouses
  # POST /warehouses.xml
  def create
    @warehouse = Warehouse.new(params[:warehouse])

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to(@warehouse, :notice => 'Warehouse was successfully created.') }
        format.xml  { render :xml => @warehouse, :status => :created, :location => @warehouse }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warehouse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warehouses/1
  # PUT /warehouses/1.xml
  def update
    @warehouse = Warehouse.find(params[:id])

    respond_to do |format|
      if @warehouse.update_attributes(params[:warehouse])
        format.html { redirect_to(@warehouse, :notice => 'Warehouse was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warehouse.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouses/1
  # DELETE /warehouses/1.xml
  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy

    respond_to do |format|
      format.html { redirect_to(warehouses_url) }
      format.xml  { head :ok }
    end
  end
end
