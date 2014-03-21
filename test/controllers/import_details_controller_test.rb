require 'test_helper'

class ImportDetailsControllerTest < ActionController::TestCase
  setup do
    @import_detail = import_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_detail" do
    assert_difference('ImportDetail.count') do
      post :create, import_detail: { import_id: @import_detail.import_id, item_description: @import_detail.item_description, item_price: @import_detail.item_price, merchant_address: @import_detail.merchant_address, merchant_name: @import_detail.merchant_name, purchase_count: @import_detail.purchase_count, purchaser_name: @import_detail.purchaser_name }
    end

    assert_redirected_to import_detail_path(assigns(:import_detail))
  end

  test "should show import_detail" do
    get :show, id: @import_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import_detail
    assert_response :success
  end

  test "should update import_detail" do
    patch :update, id: @import_detail, import_detail: { import_id: @import_detail.import_id, item_description: @import_detail.item_description, item_price: @import_detail.item_price, merchant_address: @import_detail.merchant_address, merchant_name: @import_detail.merchant_name, purchase_count: @import_detail.purchase_count, purchaser_name: @import_detail.purchaser_name }
    assert_redirected_to import_detail_path(assigns(:import_detail))
  end

  test "should destroy import_detail" do
    assert_difference('ImportDetail.count', -1) do
      delete :destroy, id: @import_detail
    end

    assert_redirected_to import_details_path
  end
end
