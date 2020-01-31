class DeliveryVerificationsController < ApplicationController
  def new
    @verification = DeliveryVerification.new
    @bid = Bid.find(params[:bid_id])
  end

  def create
    @verification = DeliveryVerification.new(verification_params)
    
    respond_to do |format|
      if @verification.save
        format.html do
          redirect_to "/delivery-verification/thank-you",
            notice: "Feedback submitted!"
        end
      else
        format.html do
          redirect_to delivery_verification_path(:bid_id => @verification.bid_id),
            notice: "An error occurred while submitting your feedback, please try again."
        end
      end
    end
  end
  
  private
  
  def verification_params
    params.require(:delivery_verification)
    .permit(
      :as_expected,
      :satisfaction_level,
      :bid_id)
  end
end
