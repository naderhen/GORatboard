class RatgradesController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  # GET /ratgrades
  # GET /ratgrades.xml
  def index
    @ratgrades = Ratgrade.all
    respond_to do |format|
      format.html
      format.js # index.html.erb
      format.xml  { render :xml => @ratgrades }
    end
  end

  # GET /ratgrades/1
  # GET /ratgrades/1.xml
  def show
    @ratgrade = Ratgrade.find(params[:id])
    @sales = @ratgrade.sales
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.xml  { render :xml => @ratgrade }
      format.iphone { render :layout => false }
    end
  end

  # GET /ratgrades/new
  # GET /ratgrades/new.xml
  def new
    @ratgrade = Ratgrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ratgrade }
    end
  end

  # GET /ratgrades/1/edit
  def edit
    @ratgrade = Ratgrade.find(params[:id])
  end

  # POST /ratgrades
  # POST /ratgrades.xml
  def create
    @ratgrade = Ratgrade.new(params[:ratgrade])

    respond_to do |format|
      if @ratgrade.save
        format.html { redirect_to(@ratgrade, :notice => 'Ratgrade was successfully created.') }
        format.xml  { render :xml => @ratgrade, :status => :created, :location => @ratgrade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ratgrade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratgrades/1
  # PUT /ratgrades/1.xml
  def update
    @ratgrade = Ratgrade.find(params[:id])

    respond_to do |format|
      if @ratgrade.update_attributes(params[:ratgrade])
        format.html { redirect_to(@ratgrade, :notice => 'Ratgrade was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ratgrade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratgrades/1
  # DELETE /ratgrades/1.xml
  def destroy
    @ratgrade = Ratgrade.find(params[:id])
    @ratgrade.destroy

    respond_to do |format|
      format.html { redirect_to(ratgrades_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def newsale
    @sale = Sale.new
    @ratgrade=Ratgrade.find(params[:id])
    
    
  end
  
  
end
