require 'test_helper'

class CronometrosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
  end

  test "should get index" do
    get cronometros_url
    assert_response :success
  end
end
