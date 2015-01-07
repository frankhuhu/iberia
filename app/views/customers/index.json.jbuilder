json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_id, :company_id, :phone, :email, :company, :address1, :address2, :address3, :address4, :address5
  json.url customer_url(customer, format: :json)
end
