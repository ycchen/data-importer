json.array!(@sales) do |sale|
  json.extract! sale, :id, :purchaser_id, :item_id, :merchant_id, :unit, :item_cost
  json.url sale_url(sale, format: :json)
end
