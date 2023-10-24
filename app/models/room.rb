class Room < ApplicationRecord

    belongs_to :room_category, optional: true
    has_many :user_rooms
    has_many :chats

end
