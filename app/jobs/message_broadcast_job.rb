class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "chat_channel_#{chat.room_id}", chat: chat
  end
end
