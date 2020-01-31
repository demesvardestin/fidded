class FlagsController < ApplicationController
  before_action :authenticate_partner!, only: :new
  
  def new
    @listing = ItemRequest.find(params[:listing_id])
    @flag = Flag.new
  end
  
  def create
    @flag = Flag.new(flag_params)
    @flag.flagger_type = (current_customer || current_partner).class.to_s
    @flag.flagger_id = (current_customer || current_partner).id
        
    
    respond_to do |format|
      if @flag.save
        format.html { redirect_to report_submitted_path(:flag_id => @flag.id),
                    notice:"Your report has been submitted!" }
      else
        format.html do
          redirect_to report_listing_path(:listing_id => @flag.item_request_id),
                notice: "An error occurred while submitting this report. Please try again."
        end
      end
    end
  end

  def report_submitted
    @flag = Flag.find(params[:flag_id])
  end
  
  private
    
  def authenticate_resource
    if !current_customer && !current_partner
      cookies[:redirect_url] = request.original_url
      render "pages/authentication"
    end
  end
  
  def flag_params
    params.require(:flag).permit(
      :item_request_id,
      :reason,
      :details
      )
  end
end
