json.extract! room_entry, :id, :comment, :flag, :created_at, :updated_at
json.url room_entry_url(room_entry, format: :json)
