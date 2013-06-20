json.array!(@idea_files) do |idea_file|
  json.extract! idea_file, :idea_id, :file, :published
  json.url idea_file_url(idea_file, format: :json)
end
