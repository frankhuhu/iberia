json.array!(@inventory_ins) do |inventory_in|
  json.extract! inventory_in, :id, :invoice, :vendor, :in_date, :content, :paid_date, :po, :truck
  json.url inventory_in_url(inventory_in, format: :json)
end
