require "test_helper"

class Public::Store　indexControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_store　index_show_url
    assert_response :success
  end

  test "should get new" do
    get public_store　index_new_url
    assert_response :success
  end
end
