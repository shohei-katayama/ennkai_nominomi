class Reservation < ApplicationRecord

  belongs_to :customer
  has_many :reservation_details, dependent: :destroy
  # has_many :stores, through: :reservation_details
  belongs_to :store

  scope :not_temporary, -> { where(temporary_flg: false) }
  scope :is_temporary, -> { where(temporary_flg: true) }

end
