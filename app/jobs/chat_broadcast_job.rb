class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    room = Room.find(data.room_id)
    userrooms = UserRoom.where(:room_id => data.room_id)
    userroom = userrooms.find_by(:user_id => data.user_id)
    count_chats = 0
    room_chats = Chat.where(:room_id => data.room_id, :user_id => data.user_id)
      room_chats.each do |chat|
        if chat[:message].length >= 10
          count_chats += 1
        end
      end
    if userroom.present?
      if count_chats >= 10 && userroom.point_check != true
        user = User.find(data.user_id)
        if user.point == 0
          user.first_point_add
        else
          user.point_add
        end
          user.save
        userroom.point_check = true
        userroom.save
      end
    end
    puts userroom.point_check
    puts "#{count_chats}*********************************************************************************************"
    # Do something later
    ActionCable.server.broadcast "some_channel_#{data.room_id}", message: render_message(data)
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'chats/chat', locals: { chat: data })
  end
end
