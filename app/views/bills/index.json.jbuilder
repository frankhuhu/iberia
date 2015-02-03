json.array!(@bills) do |bill|
  json.extract! bill, :id, :bill_no, :customer_id, :billable, :bill_date, :paid_date, :freight, :memo
  json.url bill_url(bill, format: :json)
end
