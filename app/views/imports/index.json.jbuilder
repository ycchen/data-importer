json.array!(@imports) do |import|
  json.extract! import, :id, :record_count, :total_gross_revenue, :completed, :file
  json.url import_url(import, format: :json)
end
