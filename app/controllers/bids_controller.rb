class BidsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :accept
  
  before_action :set_bid, only: [:show, :edit, :update, :delete]
  before_action :authenticate_customer!, only: [:index, :accept, :confirmation]
  before_action :authenticate_partner!, only: [:new, :create, :edit]
  
  before_action :customer_has_access_to_bids?, only: :index
  before_action :customer_has_access_to_bid?, only: [:accept, :confirmation]
  before_action :partner_has_access_to_bid?, only: [:create, :edit]
  
  def new
    @bid = Bid.new
    @ir = ItemRequest.find(params[:item_request_id])
  end

  def create
    @bid = Bid.new(bid_params)
    @ir = ItemRequest.find(params[:item_request_id])
    @bid.item_request_id = @ir.id
    @bid.partner_id = current_partner.id
    
    respond_to do |format|
      if @bid.save
        format.html { redirect_to item_request_bid_submitted_path(@ir, :bid_id => @bid.id),
                      notice: "Bid submitted!" }
                      
        Notifier.notify_customer(@bid) # notify customer of new bid
      else
        format.js { render "error", :layout => false }
      end
    end
  end

  def index
    @ir = ItemRequest.find(params[:item_request_id])
    
    if @ir.customer != current_customer
      redirect_to @ir, notice: "You do not have access to this page."
    end
    
    @bids = @ir.bids.not_declined.paginate(page: params[:page])
  end
  
  def show
    if current_partner
      if @bid.partner != current_partner
        redirect_to "/422"
      end
    elsif current_customer
      if @bid.item_request.customer != current_customer
        redirect_to "/422"
      end
    else
      redirect_to "/422"
    end
  end
  
  def edit
    
  end
  
  def accept
    @ir = @bid.item_request
    @rejected = @ir.bids.where.not(id: @bid.id)
    
    decline_reason = "#{@ir.customer.first_name} chose to move forward with another bid."
    @rejected.each do |r|
      r.update(declined: true, decline_reason: decline_reason)
    end
    
    @bid.confirm
    @ir.update(claimed: true)
    
    redirect_to item_request_confirmation_path(:bid_id => @bid.id, :ir_id => @ir.id)
    Notifier.notify_partner_of_approval(@bid, @rejected) # Notify partner
  end
  
  def decline
    @bid = Bid.find(params[:bid][:id])
    
    if current_partner != @bid.partner
      redirect_to "/422"
    end
    
    @bid.update(bid_params.merge({ :declined => true }))
    
    redirect_to item_request_bids_path(@bid.item_request),
        notice: "Bid declined, thank you for your feedback!"
    Notifier.notify_partner_of_denial(@bid) # Notify partner
  end
  
  def confirmation
    @ir = ItemRequest.find(params[:ir_id])
  end
  
  def track
    @bid = Bid.find_by(confirmation: params[:confirmation])
  end
  
  private
  
  def bid_params
    params.require(:bid)
    .permit(
      {images: []},
      :item_name,
      :item_size,
      :item_condition,
      :item_description,
      :item_brand,
      :men_or_women,
      :counter_offer,
      :waist,
      :length,
      :decline_reason
      )
  end
  
  def set_bid
    @bid = Bid.find(params[:id] || params[:bid_id])
  end
  
  def customer_has_access_to_bid?
    set_bid
    
    if @bid.item_request.fit_pic.customer != current_customer
      redirect_to :back, notice: "Oops, looks like you dont have access to this page."
    end
  end
  
  def customer_has_access_to_bids?
    @ir = ItemRequest.find_by(id: params[:item_request_id])
    
    if @ir.fit_pic.customer != current_customer
      redirect_to :back, notice: "Oops, looks like you dont have access to this page."
    end
  end
  
  def partner_has_access_to_bid?
    set_bid
    
    if @bid.partner != current_partner
      redirect_to :back, notice: "Oops, looks like you dont have access to this page."
    end
  end
end
