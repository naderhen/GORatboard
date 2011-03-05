class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.xml
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.xml
  def create
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.build(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to(@customer, :notice => 'Attachment was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @attachment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to(@customer, :notice => 'Attachment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @customer = Customer.find(params[:customer_id])
    @attachment = @customer.attachments.find(params[:id])
    
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to(@customer) }
      format.xml  { head :ok }
    end
  end
end
