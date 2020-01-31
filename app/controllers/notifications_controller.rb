class NotificationsController < ApplicationController
  before_action :set_notifications
  after_action :mark_all_as_read
  
  def index
  end
  
  def clear_all
  end
  
  private
  
  def set_notifications
    @notifications = Notification.where(
      recipient_id: (current_customer || current_partner).id,
      recipient_type: (current_customer || current_partner).class.to_s
      )
  end
  
  def mark_all_as_read
    set_notifications.mark_all_as_read
  end
end
