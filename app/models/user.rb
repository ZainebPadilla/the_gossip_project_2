class User < ApplicationRecord
    
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    
    def name
        "#{first_name} #{last_name}"
    end
    
    belongs_to :city
    has_many :gossips
    has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"

  
end
