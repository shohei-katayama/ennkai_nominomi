class Genre < ApplicationRecord
  
    has_many :stores, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  
end
