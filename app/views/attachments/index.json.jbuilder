json.array!(@attachments) do |attachment|
  json.extract! attachment, :file_name, :location, :file_size, :idea_id, :published
  json.url attachment_url(attachment, format: :json)
end