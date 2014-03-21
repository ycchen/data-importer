require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  test "should not save item without description" do
    item = Item.new
    assert !item.save, "Saved the item without a description"
  end

  test "should not save item without price" do
  	item = Item.new
  	assert !item.save, "Saved the item without a price"
  end
  
end
