json.array!(@idea_comments) do |idea_comment|
  json.extract! idea_comment, :user_id, :idea_id, :content, :published
  json.url idea_comment_url(idea_comment, format: :json)
end
