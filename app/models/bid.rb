class Bid < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    
    self.per_page = 8
    
    scope :not_declined, -> { where(declined: nil) }
    
    belongs_to :item_request
    belongs_to :partner
    has_many :notifications
    has_one :delivery_verification
    
    after_create { :notify_customer }
    
    include ResourceUtils::RandomToken
    
    def waist_length
        if waist.present? && length.present?
            return [waist, length].join("X")
        end
        
        nil
    end
    
    def status
        "Delivered"
    end
    
    def confirm
        c = ResourceUtils::RandomToken.random(10)
        
        until !Bid.exists?(confirmation: c) do
            generate_confirmation
        end
        
        update(confirmation: c, accepted: true)
    end
    
    protected
    
    def notify_customer
        
    end
end
