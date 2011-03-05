class UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_staff
  
  
  def new  
      @user = User.new
  end  

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /shippers/1
  # GET /shippers/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end


  def create  
    @user = User.new(params[:user])  
    if @user.save  
      flash[:notice] = "Registration successful."  
      redirect_to root_url  
    else  
      render :action => 'new'  
    end  
  end

  def edit  
    @user = User.find(params[:id])  
  end  

  def update  
    params[:user][:role_ids] ||= []  
    @user = User.find(params[:id])  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to root_url  
    else  
      render :action => 'edit'  
    end  
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end
