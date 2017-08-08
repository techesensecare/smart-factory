require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should not get index if the user didn't sign in" do
    get welcome_index_url
    assert_response :redirect
  end

  test "should get index if the user signed in" do
    sign_in usuarios(:alexandre)
    get welcome_index_url
    assert_response :redirect
  end

end
