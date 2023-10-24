module UserRoomsHelper
    #チャット相手のRoomレコードを取得する
    def open_userroom_record(user)
        @currentUserRooms = UserRoom.where(user_id:current_user.id)
        @currentUserRooms.each do |userroom|
            record = UserRoom.find_by(user_id: user.id, room_id: userroom.room_id)
            unless record.nil?
                return record
            end
        end
        return nil
    end
end
