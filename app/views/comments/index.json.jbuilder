json.array!(@comments) do |comment|
  json.extract! comment, :body, :user_id, :idea_id, :published
  json.url comment_url(comment, format: :json)
end