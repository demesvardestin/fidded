module ItemRequestsHelper
    def willing_to_go_up_on?(ir)
        link = "<a href='/item_requests/#{ir.id}'>#{ir.item_name}</a>"
        html = "Hi, are you willing to up the offer for this item: " << link
        
        html
    end
    
    def flex_on_details_for?(ir)
        link = "<a href='/item_requests/#{ir.id}'>#{ir.item_name}</a>"
        html = "Hi, are you flexible on the size, color, or brand for this item: " << link
        
        html
    end
    
    def sizes
        ["XS", "S", "M", "L", "XL", "XXL"]
    end
    
    def categories
        ["Shirts", "Sweaters", "Dresses", "Tops & Tees", "Skirts",
            "Jackets & Coats", "Pants", "Activewear", "Shoes", "Accessories"]
    end
    
    def genders
        ["Men's", "Women's"]
    end
    
    def views(id=nil)
        @ir = ItemRequest.find(id || params[:id])
        
        Ahoy::Event.select do |e|
          props = e.properties.with_indifferent_access
          props[:controller] == "item_requests" && props[:id].to_i == @ir.id
        end.map(&:visit_id).uniq.count
    end
end
