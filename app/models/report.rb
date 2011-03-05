class Report < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :categories, :dependent => :destroy
  
  accepts_nested_attributes_for :categories, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true  
  
  has_friendly_id :random_hash, :use_slug => true
  validates_presence_of :report_date,  :message => "can't be blank"
  validates_presence_of :notes,  :message => "Please enter some notes."
  
  
  def random_hash
    SecureRandom.hex(10)
  end

end
