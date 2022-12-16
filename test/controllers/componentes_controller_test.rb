require 'test_helper'

class ComponentesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get componentes_index_url
    assert_response :success
  end

  test "should get new" do
    get componentes_new_url
    assert_response :success
  end

  test "should get create" do
    get componentes_create_url
    assert_response :success
  end

  test "should get show" do
    get componentes_show_url
    assert_response :success
  end

  test "should get delete" do
    get componentes_delete_url
    assert_response :success
  end

end
