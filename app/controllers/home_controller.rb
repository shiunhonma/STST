class HomeController < ApplicationController
  def index
    @user = current_user
    @userrooms = UserRoom.where(user_id:@user.id)
    @currentUserRooms = current_user.user_rooms

    myRoomIds = []
    @currentUserRooms.each do |userroom|
      myRoomIds << userroom.room.id
    end
    # チャット相手を新着順でとってくる
    @anotherUserRooms = UserRoom.where(room_id: myRoomIds).where.not(user_id:@user.id).order(created_at: :desc)

    @current_userrooms = UserRoom.where(user_id: current_user.id)
    roomids = []
    @current_userrooms.each do |userroom|
      roomids << userroom.room_id
    end
    @rooms = Room.where(id: roomids)
  end
  def mypage
  end
end
