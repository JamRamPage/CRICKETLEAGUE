require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'CricketLeagues.com'
    assert_select 'p', 'Copyright James Page 2019'
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to email us.'
  end

  test "should post request contact but no email" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_url, params: {name: "Someone", email: "someone@example.com", telephone: "01234567890", message: "DUMMY"}

    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
