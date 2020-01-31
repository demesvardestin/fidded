module ConversationsHelper
    def participant_in(conversation)
        person = if current_partner
            conversation.customer
        elsif current_customer
            conversation.partner
        end
        
        person
    end
    
    def sender_is_current_sender?(message)
        message.sender == (current_customer || current_partner)
    end
    
    def participant
        current_partner || current_customer
    end
    
    def in_convo?(convo_id)
        convo_id.present?
    end
    
    def not_in_convo?(convo_id)
        in_convo? convo_id == false
    end
    
    def in_target_convo?(convo, convo_id)
        in_convo?(convo_id) && convo_id == convo.id
    end
    
    def not_in_target_convo?(convo, convo_id)
        in_target_convo?(convo, convo_id) == false
    end
    
    def not_read_by_participant(convo)
        convo.messages.last.read_by(participant) == false
    end
    
    def should_reflect_new_msg?(convo, convo_id)
        if not_read_by_participant(convo)
            if not_in_convo?(convo_id) || not_in_target_convo?(convo, convo_id)
                return true
            end
        end
        
        return false
    end
end
