require 'test_helper'

class ImportsControllerTest < ActionController::TestCase
  setup do
    @import = imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import" do
    assert_difference('Import.count') do
      post :create, import: { completed: @import.completed, file: @import.file, record_count: @import.record_count, total_gross_revenue: @import.total_gross_revenue }
    end

    assert_redirected_to import_path(assigns(:import))
  end

  test "should show import" do
    get :show, id: @import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import
    assert_response :success
  end

  test "should update import" do
    patch :update, id: @import, import: { completed: @import.completed, file: @import.file, record_count: @import.record_count, total_gross_revenue: @import.total_gross_revenue }
    assert_redirected_to import_path(assigns(:import))
  end

  test "should destroy import" do
    assert_difference('Import.count', -1) do
      delete :destroy, id: @import
    end

    assert_redirected_to imports_path
  end
end
