# frozen_string_literal: true

class Authentication::Customers::SessionsController < Devise::SessionsController
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def new
        super
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    end
  
    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || super
    end
end