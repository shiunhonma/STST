module UserRoomsHelper
    #チャット相手のRoomレコードを取得する
    def open_userroom_record(user)
        @currentUserRooms = UserRoom.where(user_id: current_user.id)
        @currentUserRooms.each do |userroom|
            record = UserRoom.find_by(user_id: user.id, room_id: userroom.room_id)
            unless record.nil?
                return record
            end
        end
        return nil
    end

    #部屋を立てた人のUserRoomを検索
    def open_currentuserroom_record(user,roomid)
        @currentUserRooms = UserRoom.find_by(user_id: user, room_id: roomid)
        unless @currentUserRooms.nil?
            return @currentUserRooms
        end
        return nil
    end

    #申請者のUserRoomを検索
    def open_anotheruserroom_record(user,roomid)
        @anotherUserRooms = UserRoom.find_by(user_id: user, room_id: roomid)
        unless @anotherUserRooms.nil?
            return @anotherUserRooms
        end
        return nil
    end


end
