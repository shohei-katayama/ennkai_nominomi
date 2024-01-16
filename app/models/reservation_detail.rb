class ReservationDetail < ApplicationRecord
  
  belongs_to :store
  belongs_to :reservation
  
end
