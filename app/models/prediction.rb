class Prediction < ActiveRecord::Base
  belongs_to :preport
  belongs_to :user
end
