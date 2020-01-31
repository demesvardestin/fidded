class ItemRequest < ApplicationRecord
    belongs_to :fit_pic
    has_many :bids, dependent: :destroy
    
    visitable :ahoy_visit
    scope :unclaimed, -> { where(claimed: false) }
    scope :listed, -> { where(listed: true) }
    
    self.per_page = 12
    
    before_create :create_uid
    before_create :sanitize_offer_price
    before_commit :set_negotiable
    
    validates_presence_of :item_name, :item_description, :item_size, :item_brand, :price_offer, :category
    
    include ResourceUtils::RandomToken
    
    def accepted_bid
        bids.find_by(accepted: true)
    end
    
    def waist_length
        if waist.present? && length.present?
            return [waist, length].join("X")
        end
        
        nil
    end
    
    def completed
        Bid.exists?(item_request_id: id, accepted: true)
    end
    
    def pending
        listed && !completed
    end
    
    def base_url
        "https://fidded.com/l/"
    end
    
    def share_link
        [base_url, uid].join("")
    end
    
    def social_share_caption
        customer = fit_pic.customer.full_name
        "#{customer} is looking for '#{item_name}' and offering $#{price_offer.to_f}, on @FiddedHQ!"
    end
    
    def customer
        fit_pic.customer
    end
    
    protected
    
    def create_uid
        uid = ResourceUtils::RandomToken.random(10)
        
        until !ItemRequest.exists?(uid: uid) do
            create_uid
        end
        
        self.uid = uid
    end
    
    def sanitize_offer_price
        self.price_offer = self.price_offer.split('$').pop
    end
    
    def set_negotiable
        n = negotiable == "Yes" ? true : false
        negotiable = n
    end
end
