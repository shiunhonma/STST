class Room < ApplicationRecord

    has_many :room_categories
    has_many :users
    belongs_to :user_room, optional:true

end
