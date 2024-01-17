class Store < ApplicationRecord

  has_many :reservations, through: :reservation_details
  has_many :reservation_details, dependent: :destroy
  belongs_to :genre
  belongs_to :customer
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(gravity: :center, resize:"#{width}x#{height}^", crop:"#{width}x#{height}+0+0").processed
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Store.where(name: content)
    elsif method == 'forward'
      Store.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Store.where('name LIKE ?', '%' + content)
    else
      Store.where('name LIKE ?', '%' + content + '%')
    end
  end

  validates :name, presence: true
  validates :introduction, presence: true

end
