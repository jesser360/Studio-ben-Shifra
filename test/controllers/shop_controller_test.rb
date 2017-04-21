require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get shop_buy_url
    assert_response :success
  end

end
