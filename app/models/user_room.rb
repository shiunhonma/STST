class UserRoom < ApplicationRecord

    has_many :Users
    has_many :rooms
end
