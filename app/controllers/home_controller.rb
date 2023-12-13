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
  end
  def mypage
  end
end
