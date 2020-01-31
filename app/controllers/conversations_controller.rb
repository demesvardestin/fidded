class ConversationsController < ApplicationController
  # before_action :authenticate_partner!, only: :initialize_conversation
  before_action :participant_has_access_to_conversation?, only: :show
  before_action :authenticate_user, only: :inbox
  
  def initialize_conversation
    unless current_partner || current_customer
      redirect_to auth_path, notice: "You need an account to perform this action!"
    end
    
    ir_id = params[:item_request_id]
    bid_id = params[:bid_id]
    
    @ir = ItemRequest.find(ir_id)
    @bid = bid_id.present? ? Bid.find_by(id: bid_id) : Bid.new
    
    customer = current_customer || @ir.customer
    partner = current_partner || @bid.partner
    user = current_customer || current_partner
    
    @conversation = Conversation.find_or_create_by(
      customer_id: customer.id,
      partner_id: partner.id)
    
    if !params[:message].nil?
      @msg = Message.create(
        sender_id: user.id,
        sender_type: user.class.to_s,
        conversation_id: @conversation.id,
        body: params[:message])
    end
    
    notice = @msg.present? ? "Your message has been sent" : nil
    redirect_to "/inbox/#{@conversation.id}", notice: notice
  end
  
  def show
    @message = Message.new
    @conversation = Conversation.find(params[:conversation_id])
    
    if @user.nil?
      redirect_to auth_path, notice: "You must be logged in!"
    end
    
    ## Mark conversation up-to-date, meaning last message read
    if @user.class.to_s == "Customer"
      @conversation.messages.mark_all_by_customer_as_read
    elsif @user.class.to_s == "Partner"
      @conversation.messages.mark_all_by_partner_as_read
    end
  end
  
  def refresh_conversation
    @conversation = Conversation.find params[:conversation_id]
    @messages = @conversation.messages
    @sender = (current_partner || current_customer)
    
    render :layout => false
  end
  
  def mark_all_as_read
    @user = current_customer || current_partner
    
    if @user.class.to_s == "Partner"
      @user.conversations.each do |c|
        c.messages.mark_all_by_partner_as_read
      end
    elsif @user.class.to_s == "Customer"
      @user.conversations.each do |c|
        c.messages.mark_all_by_customer_as_read
      end
    end
    
    render "messages_marked_read", :layout => false
  end
  
  private
  
  def participant_has_access_to_conversation?
    authenticate_user
    
    @conversation = Conversation.find params[:conversation_id]
    if !@conversation.participants.include?(@user)
      redirect_to "/422"
    end
  end
  
  def authenticate_user
    @user = (current_partner || current_customer)
    
    if @user.nil?
      if params["type"] == "partner"
        authenticate_partner!
      else
        authenticate_customer!
      end
    end
  end
end
