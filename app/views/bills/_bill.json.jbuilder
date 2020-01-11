json.extract! bill, :id, :name, :notes, :due_amount, :due_date, :url, :paid_date, :paid_amount, :created_at, :updated_at
json.url bill_url(bill, format: :json)
