json.array!(@page_items) do |page_item|
  json.extract! page_item, :order, :content, :published, :user_id
  json.url page_item_url(page_item, format: :json)
end