class PagesController < ApplicationController
    before_action :authenticate_customer!, except: [:index, :authentication]
    
    def index
        @requests = ItemRequest.unclaimed.limit(10)
    end
end
