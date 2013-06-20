json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :idea_id, :content, :published
  json.url comment_url(comment, format: :json)
end
