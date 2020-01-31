class CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def requests
    @requests = current_customer.fit_pics
  end

  def settings
  end
end
