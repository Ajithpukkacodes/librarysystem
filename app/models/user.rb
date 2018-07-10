class User < ApplicationRecord
  enum is_admin: [:user,:admin]
  has_many :books	
  has_secure_password
  validates :name, presence: true   
  validates :email, presence: true,  
            uniqueness: true,  
            format: {  
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
            }
end
