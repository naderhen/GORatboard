class Attachment < ActiveRecord::Base
  belongs_to :customer
  has_attached_file :attachment
  
  ATTACHMENT_TYPES = ["Trade Reference","Euler Report", "Sea-Fax Report", "Email"]

end
