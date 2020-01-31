module ApplicationHelper
    def team_email
        "<a href='mailto:hello@fidded.com'>hello@fidded.com</a>"
    end
    
    def navbar
        if current_customer
            "layouts/customer_navbar"
        elsif current_partner
            "layouts/partner_navbar"
        else
            "layouts/base_navbar"
        end
    end
    
    def body
        if current_customer
            "layouts/customer_body"
        elsif current_partner
            "layouts/partner_body"
        else
            "layouts/base_body"
        end
    end
    
    def footer
        "layouts/footer"
    end
    
    def url
        request.original_url
    end
    
    def unread_messages_for_customers
        current_customer.conversations.map(&:messages).flatten.select do |m|
            m.read_by_customer == false && m.read == false
        end
    end
    
    def unread_messages_for_partners
        current_partner.conversations.map(&:messages).flatten.select do |m|
            m.read_by_partner == false && m.read == false
        end
    end
    
    def current_user
        current_customer || current_partner
    end
    
    def notifications
        user = (current_customer || current_partner)
        Notification.where(
            recipient_id: user.id,
            recipient_type: user.class.to_s,
            read: false
            )
    end
    
    def path_for?(page)
        if rel_path.include?(page)
            return true
        end
        
        return false
    end
    
    def rel_path
        request.original_fullpath
    end
end
