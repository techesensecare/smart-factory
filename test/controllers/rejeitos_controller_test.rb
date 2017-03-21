require 'test_helper'

class RejeitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rejeito = rejeitos(:one)
  end

  test "should get index" do
    get rejeitos_url
    assert_response :success
  end

  test "should get new" do
    get new_rejeito_url
    assert_response :success
  end

  test "should create rejeito" do
    assert_difference('Rejeito.count') do
      post rejeitos_url, params: { rejeito: { descricao: @rejeito.descricao } }
    end

    assert_redirected_to rejeito_url(Rejeito.last)
  end

  test "should show rejeito" do
    get rejeito_url(@rejeito)
    assert_response :success
  end

  test "should get edit" do
    get edit_rejeito_url(@rejeito)
    assert_response :success
  end

  test "should update rejeito" do
    patch rejeito_url(@rejeito), params: { rejeito: { descricao: @rejeito.descricao } }
    assert_redirected_to rejeito_url(@rejeito)
  end

  test "should destroy rejeito" do
    assert_difference('Rejeito.count', -1) do
      delete rejeito_url(@rejeito)
    end

    assert_redirected_to rejeitos_url
  end
end
