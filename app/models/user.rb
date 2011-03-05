class User < ActiveRecord::Base
  acts_as_authentic
  has_many :assignments
  has_and_belongs_to_many :reports
  has_many :roles, :through => :assignments
  has_many :sales, :dependent=>:destroy
  has_many :ratgrades, :through=>:sales
  has_many :announcements, :dependent=>:destroy
  has_many :calls, :dependent=>:destroy
  has_many :predictions, :dependent=>:destroy
  has_many :pnotes
  


  
  def role_symbols
      roles.map do |role|
        role.name.underscore.to_sym
      end
  end
  
  
  def admin?
    self.roles.exists?(1)
  end
  
  def staff?
      self.roles.exists?(1) || self.roles.exists?(2) || self.roles.exists?(3)
  end
  
  def shipper?
    self.roles.exists?(4)
  end
  

end
