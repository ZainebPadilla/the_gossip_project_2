class User < ApplicationRecord
    
    def name
        "#{first_name} #{last_name}"
    end
    
    belongs_to :city
    has_many :gossips
end
