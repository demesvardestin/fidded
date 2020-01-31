module BidsHelper
    def determine_final_price(bid)
        ir = bid.item_request
        
        price = if ir.negotiable
            if bid.counter_offer.to_i != ir.price_offer.to_i
                bid.counter_offer
            end
        else
            ir.price_offer
        end.to_f
        
        return price
    end
    
    def determine_platform_fee(bid)
        price = determine_final_price(bid)
        platform_fee = price * 0.05
        
        return platform_fee
    end
    
    def determine_transaction_total(bid)
        determine_final_price(bid) + determine_platform_fee(bid)
    end
    
    def decline_reasons
        ["Not the item I'm looking for", "Counter offer too high",
            "Item seems to be in poor condition", "Bid appears to be fraudulent/spammy",
            "Other reason/decline to specify"]
    end
    
    def yes_or_no
        ["Yes", "No"]
    end
    
    def satisfaction_scale
        {
            1 => "Very unsatisfied",
            2 => "Unsatisified",
            3 => "Neutral",
            4 => "Satisfied",
            5 => "Very satisfied"
        }
    end
    
    def eta_for(bid)
        "Monday, January 20th"
    end
    
    def status_explanation_for(bid)
        case bid.status
        when "Received"
            """#{bid.partner.first_name} has been notified, and will start preparing
                your package for shipment soon.
            """
        when "Shipped"
            """#{bid.partner.first_name} has been shipped via
                #{bid.partner.preferred_shipper}.
            """
        when "In transit"
            """Your package is out for delivery. Estimated arrival: #{eta_for(bid)}.
            """
        when "Delivered"
            """Your package has been delivered. As a quality assurance measure,
                we'd like for you to confirm that everything is in order by
                heading over to our <a href='/delivery-verification?bid_id=#{bid.id}'>
                delivery verification <i class='fas fa-external-link-alt'></i></a>
                page.
            """
        end
    end
    
    def tracker_stages
        {
            "Received": {
                "name": "Received",
                "step": 0
            },
            "Shipped": {
                "name": "Shipped",
                "step": 1
            },
            "In transit": {
                "text": "In transit",
                "step": 2
            },
            "Delivered": {
                "name": "Delivered",
                "step": 3
            },
        }.with_indifferent_access
    end
end
