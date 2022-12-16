require 'test_helper'

class SubProdutosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_produtos_index_url
    assert_response :success
  end

  test "should get new" do
    get sub_produtos_new_url
    assert_response :success
  end

  test "should get create" do
    get sub_produtos_create_url
    assert_response :success
  end

  test "should get show" do
    get sub_produtos_show_url
    assert_response :success
  end

  test "should get delete" do
    get sub_produtos_delete_url
    assert_response :success
  end

end
