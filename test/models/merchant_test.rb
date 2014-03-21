require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save merchant without name" do
  	merchant = Merchant.new
  	assert !merchant.save, "Saved the merchant without a name"
  end

  test "should not save merchant without address" do
  	merchant = Merchant.new
  	assert !merchant.save, "Saved the merchant without an address"
  end

end
