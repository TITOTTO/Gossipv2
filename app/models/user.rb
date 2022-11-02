class User < ApplicationRecord
    belongs_to :city
    has_many :gossips
    has_secure_password
    validates :password, 
        presence: true, 
        length: { minimum: 6 }
    has_many :likes
end
