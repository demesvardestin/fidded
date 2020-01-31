class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :prevent_reauthentication
  
    private
  
    def prevent_reauthentication
        url = request.original_url
        
        if current_customer
            if url.include?('partners/sign_in') || url.include?('partners/sign_up')
                redirect_to root_path, notice: "In order to access this page, please sign out and either log in or create a partner account."
            end
        elsif current_partner
            if url.include?('customers/sign_in') || url.include?('customers/sign_up')
                redirect_to root_path, notice: "In order to access this page, please sign out and either log in or create a customer account."
            end
        end
    end
end
