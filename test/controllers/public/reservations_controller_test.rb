require "test_helper"

class Public::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_reservations_show_url
    assert_response :success
  end
end
