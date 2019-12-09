require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'CricketLeagues.com'
    assert_select 'p', 'Copyright James Page 2019'
    assert_select 'img' do
      assert_select '[src=?]', 'images/logo.jpg'
    end
    assert_select 'p', 'Use the nav bar to select the page to visit.'
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to email us.'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_contact_form.js'
    end
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

  test "should get batters" do
    get batters_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Batters'
    assert_select 'th', 'Name'
    assert_select 'th', 'Team'
    assert_select 'th', 'Runs'
    assert_select 'th', 'Average'
    assert_select 'th', '4s'
    assert_select 'th', '6s'
    assert_select 'th', 'Highest Score'
    assert_select 'th', 'Inningses'
    assert_select 'p', 'Copyright James Page 2019'
  end

  test "should get bowlers" do
    get bowlers_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Bowlers'
    assert_select 'th', 'Name'
    assert_select 'th', 'Team'
    assert_select 'th', 'Wickets'
    assert_select 'th', 'Runs'
    assert_select 'th', 'Average'
    assert_select 'th', 'Best Bowling'
    assert_select 'th', 'Inningses'
    assert_select 'th', 'Bowling Style'
    assert_select 'p', 'Copyright James Page 2019'
  end

end
