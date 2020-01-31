class FitPicsController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @fp = FitPic.new
  end
  
  def create
    @fp = FitPic.new(fp_params)
    @fp.customer = current_customer
    
    respond_to do |format|
      if @fp.save
        format.html { redirect_to item_details_path(:fp_id => @fp.id) }
      end
    end
  end
  
  private
  
  def fp_params
    params.require(:fit_pic).permit(:url)
  end
end
