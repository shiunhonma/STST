class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    # Do something later
    ActionCable.server.broadcast "some_channel_#{data.room_id}", message: render_message(data)
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'chats/chat', locals: { chat: data })
  end
end
