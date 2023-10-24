class RoomChannel < ApplicationCable::Channel
# 接続されたとき
  def subscribed
    # stream_from "some_channel"
  end

# 切断されたとき
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def room_select(data)
    stream_from "some_channel"
  end

  def speak(data)
    Chat.create! message: data['message'], user_id: data['user'] room_id: data['room']
  end
end
