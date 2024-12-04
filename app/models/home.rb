class Home < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "heading", "id", "id_value", "message_one", "message_one_heading", "message_two", "message_two_heading", "moto", "updated_at"]
      end
    
end
