class Import < ActiveRecord::Base
	has_attached_file :file

	validates_attachment :file, :presence => true

  	# validates_attachment_content_type :file, :content_type => 'text/plain'

	validates_attachment_content_type :file, :content_type => %w(application/octet-stream)
	# validates_attachment_file_name :file, :matches => []
	# validates_attachment :file, :presence => true,
	# :content_type => { :content_type => %w()},
	# :file_name => {:matches => %w(txt tab)},
	# :size => { :in => 0..100.kilobytes}
	# validates_attachment_file_name :file, :matches => [/tab\Z/, /jpe?g\Z/]
	# validates :file, :attachment_presence => true
	# validates_attachment_content_type :file, :content_type => %w(image/jpeg image/jpg image/png text/tab)

	has_many :import_details
	
	def process_file(process_id)
		gross_revenue = 0
		logger.debug "#{self.file.path}" 
		CSV.foreach(self.file.path, col_sep: "\t", headers: true) do |row|
			# insert into Import_details table
			import_detail = ImportDetail.new
			import_detail.purchaser_name = row['purchaser name']
			import_detail.merchant_name  = row['merchant name']
			import_detail.merchant_address = row['merchant address']
			import_detail.item_description = row['item description']
			import_detail.item_price = row['item price'].to_f
			import_detail.purchase_count =  row['purchase count']
			import_detail.import_id = process_id
			import_detail.save!

			gross_revenue += import_detail.purchase_count * import_detail.item_price

			# building data hash with purchaser, merchant, item, and sale data
			data={
				purchaser: {name: row['purchaser name']},
				merchant: {name: row['merchant name'], address: row['merchant address']},
				item: {description: row['item description'], price: row['item price']},
				sale: {item_cost: row['item price'], unit: row['purchase count']}
			}
			
			purchaser = set_purchaser(data)
			merchant  = set_merchant(data)
			item      = set_item(data)
			
			Sale.create!(data[:sale].merge(
					{purchaser: purchaser,
					 merchant: merchant,
					 item: item
					}))
			# puts "--------------#{data.inspect}"
			# puts "sale: #{sale}"
		end
		# puts "Total count: #{import_details.count}, gross revenue: #{gross_revenue}"
		# Update import record
		import = Import.find(process_id)
		import.record_count = import_details.count
		import.total_gross_revenue = gross_revenue
		import.completed = true
		import.save!

	end

	private

	def set_purchaser(data) 
		Purchaser.find_or_create_by!(data[:purchaser])
	end

	def set_merchant(data)
		Merchant.find_or_create_by!(data[:merchant])
	end
	
	def set_item(data)
		Item.find_or_create_by!(data[:item])
	end
end
