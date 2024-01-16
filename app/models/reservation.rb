class Reservation < ApplicationRecord
  
  belongs_to :customer
  has_many :reservation_details, dependent: :destroy
  has_many :stores, through: :reservation_details
  
  validates :name
  
end
