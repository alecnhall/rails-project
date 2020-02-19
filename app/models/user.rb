class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
    before_save { self.email = email.downcase }
    has_one :pantry
    has_many :items, through: :pantry
    has_many :recipes
end
