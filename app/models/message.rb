class Message < ApplicationRecord
    belongs_to :conversation
    after_create :notify_pusher
    
    def sender
        sender_type.constantize.find(sender_id)
    end
    
    def read_by(user)
        if user.class.to_s == "Customer"
            read_by_customer == true
        elsif user.class.to_s == "Partner"
            read_by_partner == true
        end
    end
    
    def self.mark_all_by_customer_as_read
        unread_by_customer.each do |n|
            n.update(read: true, read_by_customer: true)
        end
    end
    
    def self.mark_all_by_partner_as_read
        unread_by_partner.each do |n|
            n.update(read: true, read_by_partner: true)
        end
    end
    
    def self.mark_all_by_customer_as_unread
        read_by_customer.each do |n|
            n.update(read: false, read_by_customer: false)
        end
    end
    
    def self.mark_all_by_partner_as_unread
        read_by_partner.each do |n|
            n.update(read: false, read_by_partner: false)
        end
    end
    
    def self.unread_by_customer
        self.where(read_by_customer: false, read: false)
    end
    
    def self.unread_by_partner
        self.where(read_by_partner: false, read: false)
    end
    
    def self.read_by_customer
        self.where(read_by_customer: true, read: true)
    end
    
    def self.read_by_partner
        self.where(read_by_partner: true, read: true)
    end
    
    protected
    
    def notify_pusher
        Pusher
        .trigger("conversation", "message", { conversation_id: conversation.id })
        .as_json
    end
end
