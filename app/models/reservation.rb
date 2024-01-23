class Reservation < ApplicationRecord

  belongs_to :customer
  belongs_to :store

  scope :not_temporary, -> { where(temporary_flg: false) }
  scope :is_temporary, -> { where(temporary_flg: true) }

end
