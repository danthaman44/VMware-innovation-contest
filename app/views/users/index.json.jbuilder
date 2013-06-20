json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :job_title, :phone, :technical_expertise, :email_idea_comments, :email_news, :is_admin
  json.url user_url(user, format: :json)
end
