require "test_helper"

class Admin::StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_store_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_store_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_store_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_store_edit_url
    assert_response :success
  end
end
