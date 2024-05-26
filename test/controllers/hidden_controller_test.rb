require "test_helper"

class HiddenControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hidden_show_url
    assert_response :success
  end
end
