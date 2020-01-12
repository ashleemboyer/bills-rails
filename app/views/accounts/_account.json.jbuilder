json.extract! account, :id, :name, :url, :created_at, :updated_at
json.url account_url(account, format: :json)
