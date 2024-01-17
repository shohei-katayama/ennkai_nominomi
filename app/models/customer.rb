class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reservations, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
