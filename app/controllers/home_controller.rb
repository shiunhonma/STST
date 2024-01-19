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
  def graph
    time_total = 0
    
    # 日付データの配列を生成
    base_days = [*Date.current - 1.week .. Date.current]

    data_time = []
    # 一日毎の勉強時間を取得して配列に格納する
    base_days.each do |base_day|
      rec = StudyTime.where(user_id: current_user.id).where(date:base_day).group("date").sum(:time)
      time = 0
      rec.each do |key, value|
        time = value / 3600.0 # 秒を時にする
        time_total = time_total + time
      end
    data_time << [base_day.strftime('%Y年%-m月%-d日').to_s, time]
  end
  
  data_average = []
  # 平均の勉強時間を配列に格納する
  base_days.each do |base_day|
    data_average << [base_day.strftime('%Y年%-m月%-d日').to_s, time_total / base_days.length]
  end
  

  @chart_data = [{name:"勉強時間", data: data_time},{name:"平均時間", data: data_average}]
end
end
