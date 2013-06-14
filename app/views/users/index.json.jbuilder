json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :job_title, :phone, :expertise, :email_notification_comment, :email_notification_news, :is_admin
  json.url user_url(user, format: :json)
end