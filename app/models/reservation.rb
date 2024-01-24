class Reservation < ApplicationRecord

  belongs_to :customer
  belongs_to :store

  scope :not_temporary, -> { where(temporary_flg: false) }
  scope :is_temporary, -> { where(temporary_flg: true) }
  
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :guests, presence: true

end
