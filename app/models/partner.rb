class Partner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :bids
  has_many :favorites
  has_many :conversations
  include ResourceUtils::Profile
  
  mount_uploader :image, ImageUploader
  
  def has_saved(item_request)
    favorites.map(&:item_request_id).include?(item_request.id)
  end
  
  def full_name
    [first_name, last_name].join(' ')
  end
  
  def verification_channels
    verified_via.split(',')
  end
end
