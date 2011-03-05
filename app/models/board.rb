class Board < ActiveRecord::Base
  has_many :warehouses, :dependent => :destroy
  has_many :ratgrades, :through=>:warehouses
  has_many :sales
  has_one :preport, :dependent=> :destroy
  
  accepts_nested_attributes_for :warehouses, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  
  
  scope :for_today , where("board_date = ?", Date.today)



  validates_uniqueness_of :board_date, :on => :create, :message => "There is already a Board created for this day"
  validates_presence_of :board_date,  :message => "can't be blank"
  
  after_save :create_prediction_report
  
  
  def create_prediction_report
    @prediction_report = Preport.new(:board_id=>self.id, :created_at=>Time.now)
    @prediction_report.save!
  end

  def available
    availableamt=0
    self.warehouses.each do |warehouse|
      availableamt+=warehouse.available
    end
    return availableamt
  end
  
  
  def sold
    soldamt=0
    self.warehouses.each do |warehouse|
      soldamt+=warehouse.sold
    end
    return soldamt
  end
  
  
  def pct_sold
    inventory = self.available+self.sold
    
    percent = self.sold.to_f/inventory.to_f
    
    p = percent * 100
    return p
    
  end
  
  
  def progress_color
    if self.pct_sold > 0 && self.pct_sold < 33
      return "red"
    elsif self.pct_sold >= 33 && self.pct_sold < 66
      return "blue"
    elsif self.pct_sold >= 66 && self.pct_sold < 100
      return "green"
    end
    
  end
  


end
