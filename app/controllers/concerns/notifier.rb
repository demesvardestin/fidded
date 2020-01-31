module Notifier
    def self.notify_via(channel, req)
        
    end
    
    def self.notify_customer(bid)
        ir = bid.item_request
        customer = ir.customer
        
        
    end
    
    def self.notify_partner_of_approval(bid, rejected)
        # message = "Good news, #{bid.item_request.customer.full_name} has accepted your bid!"
        
        # Notification.create(
        #     message: message,
        #     recipient_id: bid.partner.id,
        #     recipient_type: "Partner"
        #     )
    end
    
    def self.notify_partner_of_denial(bid)
        
    end
end