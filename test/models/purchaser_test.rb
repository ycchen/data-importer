require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save purchaser without name" do
  	purchaser = Purchaser.new
  	assert !purchaser.save, "Saved the purchaser without a name"
  end

end
