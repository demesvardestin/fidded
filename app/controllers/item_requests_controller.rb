class ItemRequestsController < ApplicationController
  before_action :set_item_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!, only: [:new, :create, :edit, :bid_history]
  before_action :authorize_customer, only: [:edit, :update, :destroy]
  before_action :authenticate_partner!, only: [:save, :authenticate_partner_before_saving]
  after_action :track_action, only: :show
  
  def new
    @fp = FitPic.find(params[:fp_id])
    @ir = ItemRequest.new
  end
  
  def create
    @ir = ItemRequest.new(item_request_params)
    @ir.listed = true
    @ir.negotiable = @ir.negotiable == "Yes" ? true : false
    @fp = FitPic.find(@ir.fit_pic_id)
    
    respond_to do |format|
      if @ir.save
        format.html do
          redirect_to item_request_path(@ir),
            notice: "Your request has been published! Share it on social media to boost your reach!"
          
          Notifier.notify_via(:all, @ir)
        end
      else
        format.html do
          redirect_to item_details_path(:fp_id => @fp.id),
            notice: "There was an error creating your request, please try again."
        end
      end
    end
  end
  
  def show
    
  end
  
  def edit
    @fp = @ir.fit_pic
  end
  
  def update
    params[:item_request][:negotiable] = case params[:item_request][:negotiable]
      when "Yes"
        true
      else
        false
    end
    
    @ir.update!(item_request_params.merge({:fit_pic_id => @ir.fit_pic_id}))
    
    respond_to do |format|
      if @ir.save
        format.html do
          redirect_to item_request_path(@ir), notice: "Your changes have been saved!"
        end
      else
        format.html do
          redirect_to edit_item_request_path(@ir),
            notice: "An error occurred while saving your changes. Please try again."
        end
      end
    end
  end
  
  def destroy
    @ir.destroy
    
    redirect_to request_history_path, notice: "Your request was successfully removed!"
  end
  
  def request_history
    @ir = current_customer
          .item_requests
          .order('created_at DESC')
          .paginate(page: params[:page])
  end

  def index
    @ir = ItemRequest.unclaimed.listed.all
  end
  
  def filter_request_history
    filter = case params[:filter].downcase
      when "completed"
        true
      else
        false
    end
    
    @ir = if filter.present?
      current_customer.item_requests.where(claimed: filter)
    else
      current_customer.item_requests.all
    end.paginate(page: params[:page])
    
    if params[:page]
      return render "filter_request_history.html.erb"
    end
    
    render "filter_request_history.js.erb", :layout => false
  end
  
  def new_bid
    @bid = Bid.new
  end
  
  def bid_submitted
    @bid = Bid.find(params[:bid_id])
    @notice = "Bid submitted! We'll let you know if
                #{@bid.item_request.customer.first_name} accepts it!"
  end
  
  def authenticate_partner_before_saving
    @ir = ItemRequest.find(params[:item_request_id])
    p @ir
    redirect_to @ir
  end
  
  def save
    @fav = Favorite.create(partner_id: current_partner.id, item_request_id: params[:item_request_id])
    
    render "listing_saved", :layout => false
  end
  
  def saved
    @saved = current_partner.favorites.map(&:item_request)
  end
  
  def find_by_uid
    @ir = ItemRequest.find_by(uid: params[:uid])
    
    redirect_to @ir
  end
  
  private
  
  def item_request_params
    params.require(:item_request)
    .permit(
      :item_name,
      :item_description,
      :item_size,
      :item_brand,
      :price_offer,
      :negotiable,
      :fit_pic_id,
      :waist,
      :length,
      :men_or_women,
      :category
      )
  end
  
  def track_action
    ahoy.track "Tracking for: ", request.path_parameters
  end
  
  def resources_unauthenticated
    !current_partner && !current_customer
  end
  
  def set_item_request
    @ir = ItemRequest.find(params[:id])
  end
  
  def authorize_customer
    set_item_request
    
    if !current_customer || (@ir.customer != current_customer)
      redirect_to :back, notice: "Oops, you don't have access to this page."
    end
  end
end
