class Ratgrade < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :board
  has_many :sales, :dependent => :destroy
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :total, :message => "can't be blank"
  
  
  def availableamt
    self.total-self.sales.sum('amount')
  end
  
  
  
  
  def sold
    self.sales.sum('amount')
  end
  
  def average_price
    total_sales=self.sales.average("price")
    return total_sales
  end
end
