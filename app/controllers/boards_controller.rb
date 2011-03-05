require 'fastercsv'
class BoardsController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  
  
  
  
  # GET /boards
  # GET /boards.xml
  def index
    @boards = Board.all

    
    @salesreps = Role.find(2).users
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.xml
  def show
    @board = Board.find(params[:id])
    @salesreps = Role.find(2).users
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.xml
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
  end

  # POST /boards
  # POST /boards.xml
  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        format.html { redirect_to(root_url, :notice => 'Board was successfully created.') }
        format.xml  { render :xml => @board, :status => :created, :location => @board }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.xml
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to(root_url, :notice => 'Board was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.xml
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to(boards_url) }
      format.xml  { head :ok }
    end
  end
  
  def rat_sales
    @board = Board.find(params[:id])
    @sales = @board.sales
    @unprinted = @sales.unprinted.size
    @salesreps = Role.find(2).users

    
  end
  
  
  
  
  def print_sales
    @board = Board.find(params[:id])
    @sales=@board.sales.find(:all, :include=>:customer, :order=>'customers.name asc')
    @sales.each do |sale|
      
      sale.printed="true"
      sale.save!
    end
    respond_to do |format|
      format.html {render :layout => 'worksheet'}
      format.xml
    end
  end
  
  def print_user_sales
    @board = Board.find(params[:id])
    @user = User.find(params[:user_id])
    
    @sales=@board.sales.find(:all, :conditions=>{"user_id" => params[:user_id]})
    @sales.each do |sale|
      
      sale.printed="true"
      sale.save!
    end
    respond_to do |format|
      format.html {render :layout => 'worksheet'}
      format.xml  { render :xml => @sale }
    end
  end
  
  def print_unprinted_sales
    @board = Board.find(params[:id])
    @sales=@board.sales.unprinted.find(:all, :include=>:customer, :order=>'customers.name asc')
    @sales.each do |sale|
      sale.printed="true"
      sale.save!
    end
    
    respond_to do |format|
      format.html {render :layout => 'worksheet'}
      format.xml  { render :xml => @sale }
    end
  end
  
  def print_csv
    @board = Board.find(params[:id])
    @sales=@board.sales.find(:all, :include=>:customer, :order=>'customers.name asc')
    
    csv_string = FasterCSV.generate do |csv|
      csv<<["Salesperson","Sale Amount","Grade","Customer","Invoice Date","FOB","Price", "Size Pref", "G/T/F", "Notes"]
      
      @sales.group_by(&:warehouse_id).sort.each do |warehouse_id,sales|
        warehouse = Warehouse.find(warehouse_id)
        csv<<[warehouse.name]
        sales.each do |sale|
          csv<<[sale.user.full_name, sale.amount, sale.ratgrade.name, sale.customer.name, sale.invoice_date, sale.fob, sale.price, sale.size_pref, sale.cotefr, sale.notes]
        end
        csv<<[]
      end
    end
    
    
    send_data csv_string,
                :type => 'text/csv; charset=iso-8859-1; header=present',
                :disposition => "attachment; filename=orders-#{@board.board_date}.csv"
  end
  
  
end
