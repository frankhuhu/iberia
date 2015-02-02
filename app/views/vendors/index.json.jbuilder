json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :contact, :vendor_id, :phone, :fax, :email, :address
  json.url vendor_url(vendor, format: :json)
end
