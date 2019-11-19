require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'CricketLeagues.com'
    assert_select 'p', 'Copyright James Page 2019'
  end

end
