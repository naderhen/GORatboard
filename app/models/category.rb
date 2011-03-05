class Category < ActiveRecord::Base
  belongs_to :report
  has_many :grades, :dependent => :destroy
  accepts_nested_attributes_for :grades, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true  
  
  validates_presence_of :name, :message => "can't be blank"
end
