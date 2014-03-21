json.array!(@import_details) do |import_detail|
  json.extract! import_detail, :id, :purchaser_name, :merchant_name, :merchant_address, :item_description, :item_price, :purchase_count, :import_id
  json.url import_detail_url(import_detail, format: :json)
end
