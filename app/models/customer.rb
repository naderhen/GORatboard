class Customer < ActiveRecord::Base
  has_many :sales
  has_many :attachments
  has_many :calls
  validates_presence_of :name, :message => "can't be blank"
  
  scope :personals, where('client_type = ?', 'Personal')
  scope :prospects, where('client_type = ?', 'Prospect')
  scope :shippers, where('client_type = ?', 'Shipper')
 
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  def self.per_page
    10
  end
  
  
end
