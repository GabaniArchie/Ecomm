require "test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_cart" do
    get cart_add_to_cart_url
    assert_response :success
  end

  test "should get remove_from_cart" do
    get cart_remove_from_cart_url
    assert_response :success
  end

  test "should get update_cart" do
    get cart_update_cart_url
    assert_response :success
  end
end
