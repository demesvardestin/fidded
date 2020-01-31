class FitPic < ApplicationRecord
    has_many :item_requests, dependent: :destroy
    belongs_to :customer
    
    # mount_uploader :url, ImageUploader
end