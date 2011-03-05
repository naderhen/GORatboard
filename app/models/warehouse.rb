class Warehouse < ActiveRecord::Base
  belongs_to :board
  has_many :ratgrades, :dependent => :destroy
  has_many :sales
  accepts_nested_attributes_for :ratgrades, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  validates_presence_of :name, :message => "can't be blank"
  
  
  def available
    availableamt=0
    self.ratgrades.each do |grade|
      availableamt+=grade.availableamt
    end
    return availableamt
  end
  
  
  def sold
    soldamt=0
    self.ratgrades.each do |grade|
      soldamt+=grade.sold
    end
    return soldamt
  end
end
