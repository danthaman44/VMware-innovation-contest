json.array!(@ideas) do |idea|
  json.extract! idea, :title, :description, :user_id, :published
  json.url idea_url(idea, format: :json)
end