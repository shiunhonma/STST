json.extract! user_room, :id, :user_id, :room_id, :created_at, :updated_at
json.url user_room_url(user_room, format: :json)
