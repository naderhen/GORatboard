class Pnote < ActiveRecord::Base
  belongs_to :user
  belongs_to :preport
end
