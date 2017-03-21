require 'test_helper'

class CelulasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @celula = celulas(:one)
  end

  test "should get index" do
    get celulas_url
    assert_response :success
  end

  test "should get new" do
    get new_celula_url
    assert_response :success
  end

  test "should create celula" do
    assert_difference('Celula.count') do
      post celulas_url, params: { celula: { centro_id: @celula.centro_id, descricao: @celula.descricao } }
    end

    assert_redirected_to celula_url(Celula.last)
  end

  test "should show celula" do
    get celula_url(@celula)
    assert_response :success
  end

  test "should get edit" do
    get edit_celula_url(@celula)
    assert_response :success
  end

  test "should update celula" do
    patch celula_url(@celula), params: { celula: { centro_id: @celula.centro_id, descricao: @celula.descricao } }
    assert_redirected_to celula_url(@celula)
  end

  test "should destroy celula" do
    assert_difference('Celula.count', -1) do
      delete celula_url(@celula)
    end

    assert_redirected_to celulas_url
  end
end
