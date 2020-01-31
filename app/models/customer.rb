class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :fit_pics
  has_many :item_requests, through: :fit_pics
  has_many :flags
  has_many :conversations
  include ResourceUtils::Profile
  
  mount_uploader :image, ImageUploader
  
  def full_name
    [first_name, last_name].join(' ')
  end
end
