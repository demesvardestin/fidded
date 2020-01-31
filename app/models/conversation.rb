class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :partner
    belongs_to :customer
    # default_scope { sort_by &:last_message_date }
    
    def participants
        [Customer.find(customer_id), Partner.find(partner_id)]
    end
    
    def last_message_date
        messages.last.created_at
    end
end
