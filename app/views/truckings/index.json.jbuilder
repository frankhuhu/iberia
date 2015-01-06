json.array!(@truckings) do |trucking|
  json.extract! trucking, :id, :vendor_po, :vendor, :truck_po, :trucker, :pol, :order_date, :received_date, :commodity, :remarks
  json.url trucking_url(trucking, format: :json)
end
