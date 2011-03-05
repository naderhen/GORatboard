class DashboardController < ApplicationController
before_filter :require_user
  autocomplete :customer, :name, :full=>true

  def index
        @ratboard=Board.for_today.first
        @salesreps = Role.find(2).users
        if @ratboard 
          @sales=@ratboard.sales
          @my_sales = @sales.find(:all, :conditions=>["user_id=?", current_user.id]) 
        end

        @reports = @current_user.reports
        @users=User.all
        @sale=Sale.new
        
        
        
        
        
        respond_to do |format|
          format.html
          format.iphone { render :layout => false }
        end
        
        
        
  end

end
