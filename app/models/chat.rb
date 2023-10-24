class Chat < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :room, optional: true

    after_create_commit { ChatBroadcastJob.perform_later self}
end