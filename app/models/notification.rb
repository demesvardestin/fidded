class Notification < ApplicationRecord
    belongs_to :bid
    
    def self.mark_all_as_read
        unread.each do |n|
            n.update(read: true)
        end
    end
    
    def self.mark_all_as_unread
        read.each do |n|
            n.update(read: false)
        end
    end
    
    def self.unread
        where(read: false)
    end
    
    def self.read
        where(read: true)
    end
end
