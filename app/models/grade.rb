class Grade < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :price, :message => "can't be blank"
  validates_presence_of :trend, :message => "can't be blank"
end
