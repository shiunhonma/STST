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
    stream_from "some_channel_#{data['room']}"
  end

  def speak(data)
    unless data['message'] == ""
        Chat.create! message: data['message'], user_id: data['user'], room_id: data['room']
    end
  end
end
