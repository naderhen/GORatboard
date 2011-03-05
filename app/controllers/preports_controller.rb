class PreportsController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  # GET /preports
  # GET /preports.xml
  def index
    @preports = Preport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @preports }
    end
  end

  # GET /preports/1
  # GET /preports/1.xml
  def show
    if params[:board_id]
      @board = Board.find(params[:board_id])
      @preport = @board.preport
    else
      @preport = Preport.find(params[:id])
    end
    
    
    @pnotes = @preport.pnotes
    @pnote=Pnote.new
    
    
  
    
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @preport }
    end
  end

  # GET /preports/new
  # GET /preports/new.xml
  def new
    @preport = Preport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preport }
    end
  end

  # GET /preports/1/edit
  def edit
    @preport = Preport.find(params[:id])
  end

  # POST /preports
  # POST /preports.xml
  def create
    @preport = Preport.new(params[:preport])

    respond_to do |format|
      if @preport.save
        format.html { redirect_to(@preport, :notice => 'Preport was successfully created.') }
        format.xml  { render :xml => @preport, :status => :created, :location => @preport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /preports/1
  # PUT /preports/1.xml
  def update
    @preport = Preport.find(params[:id])

    respond_to do |format|
      if @preport.update_attributes(params[:preport])
        format.html { redirect_to(@preport, :notice => 'Preport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @preport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /preports/1
  # DELETE /preports/1.xml
  def destroy
    @preport = Preport.find(params[:id])
    @preport.destroy

    respond_to do |format|
      format.html { redirect_to(preports_url) }
      format.xml  { head :ok }
    end
  end
end
