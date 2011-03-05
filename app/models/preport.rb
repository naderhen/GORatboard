class Preport < ActiveRecord::Base
  belongs_to :board
  has_many :predictions, :dependent=>:destroy
  has_many :pnotes, :dependent=>:destroy
  
  after_save :create_user_predictions
  
  
  def create_user_predictions
    @salesreps = Role.find(2).users
    @salesreps.each do |salesrep|
      prediction=Prediction.new(:user_id=>salesrep.id, :preport_id=>self.id)
      prediction.save!
    end
  end
end
