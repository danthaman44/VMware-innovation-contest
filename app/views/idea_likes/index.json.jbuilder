json.array!(@idea_likes) do |idea_like|
  json.extract! idea_like, :user_id, :idea_id
  json.url idea_like_url(idea_like, format: :json)
end
