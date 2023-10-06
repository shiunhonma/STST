json.extract! room, :id, :room_name, :room_category, :user_id, :created_at, :updated_at
json.url room_url(room, format: :json)
