require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get whos_in" do
    get static_pages_whos_in_url
    assert_response :success
  end

end
