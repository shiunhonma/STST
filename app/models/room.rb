class Room < ApplicationRecord

    has_many :room_categories
    has_many :Users
    belongs_to :user_room, optional:true

end
