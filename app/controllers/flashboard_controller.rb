class FlashboardController < ApplicationController
  def index
    @ratboard=Board.for_today.first
    @salesreps = Role.find(2).users
    
    
    if @ratboard 
      @sales=@ratboard.sales
      @ratgrades = @ratboard.ratgrades
    end
    
    respond_to do |format|
      format.html { render :layout => "flashboard"}
    end
    
    
    
  end

end