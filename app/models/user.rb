class User < ApplicationRecord
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true
    validates :email, length: { maximum: 255}
    validates :email, format: {with: VALID_EMAIL_REGEX}
    validates :email, uniqueness: { case_sensitive: false}
    
    with_options on: :update? do
        validates :password, presence: true
        validates :password, length: {minimum: 8 }
    end
    
    has_secure_password

    validates :name, presence: true

    has_many :user_rooms, dependent: :destroy
    has_many :chats
    has_many :room_entries
end
