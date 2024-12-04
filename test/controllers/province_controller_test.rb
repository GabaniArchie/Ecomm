require "test_helper"

class ProvinceControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get province_name:string_url
    assert_response :success
  end
end
