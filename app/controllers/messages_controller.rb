class MessagesController < ApplicationController
    before_action :participant_has_access_to_conversation?, only: :create
    
    def create
        @message = Message.new(message_params)
        @message.sender_type = @sender.class.to_s
        @message.sender_id = @sender.id
        @message.conversation_id = @conversation.id
        if @sender.class.to_s == "Customer"
            @message.read_by_customer = true
        elsif @sender.class.to_s == "Partner"
            @message.read_by_partner = true
        end
        
        respond_to do |format|
            if @message.save
                @messages = @conversation.messages
                
                format.js do
                    @notice = "Message sent!"
                    render "create", :layout => false
                end
            else
                format.js do
                    @notice = "An error occurred while sending this message. Please try again."
                    render "error_sending", :layout => false
                end
            end
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:body)
    end
    
    def participant_has_access_to_conversation?
        @sender = (current_partner || current_customer)
        @conversation = Conversation.find params[:conversation_id]
        
        if !@conversation.participants.include?(@sender)
            @notice = "An error occurred while sending this message. Please try again."
            render "error_sending", :layout => false
        end
    end
end