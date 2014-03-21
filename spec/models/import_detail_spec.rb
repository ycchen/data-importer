require 'spec_helper'

describe ImportDetail do
	it { should validate_presence_of(:purchaser_name) }
	it { should validate_presence_of(:merchant_name) }
	it { should validate_presence_of(:merchant_address) }
	it { should validate_presence_of(:item_description) }
	it { should validate_presence_of(:item_price) }
	it { should validate_presence_of(:purchase_count) }
	it { should validate_presence_of(:import_id) }
end
