json.array!(@likes) do |like|
  json.extract! like, :user_id, :idea_id
  json.url like_url(like, format: :json)
end