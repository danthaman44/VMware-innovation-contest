json.array!(@pages) do |page|
  json.extract! page, :user_id, :title, :content, :sort_order, :published
  json.url page_url(page, format: :json)
end
