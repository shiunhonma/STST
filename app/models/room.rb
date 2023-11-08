class Room < ApplicationRecord

    belongs_to :room_category, optional: true
    has_many :user_rooms, dependent: :destroy
    has_many :chats
    has_many :room_entries, dependent: :destroy
    belongs_to :user, optional: true

end
