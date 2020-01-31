class Favorite < ApplicationRecord
    belongs_to :partner
    
    def item_request
        ItemRequest.find_by(id: item_request_id)
    end
end
