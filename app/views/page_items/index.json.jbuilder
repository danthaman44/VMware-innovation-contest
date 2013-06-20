json.array!(@page_items) do |page_item|
  json.extract! page_item, :user_id, :title, :content, :sort_order, :published
  json.url page_item_url(page_item, format: :json)
end
