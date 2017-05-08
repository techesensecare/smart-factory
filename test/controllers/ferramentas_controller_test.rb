require 'test_helper'

class FerramentasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ferramenta = ferramentas(:one)
  end

  test "should get index" do
    get ferramentas_url
    assert_response :success
  end

  test "should get new" do
    get new_ferramenta_url
    assert_response :success
  end

  test "should create ferramenta" do
    assert_difference('Ferramenta.count') do
      post ferramentas_url, params: { ferramenta: { codigo: @ferramenta.codigo, descricao: @ferramenta.descricao, observacao: @ferramenta.observacao, quantidade: @ferramenta.quantidade, tipo: @ferramenta.tipo, um: @ferramenta.um } }
    end

    assert_redirected_to ferramenta_url(Ferramenta.last)
  end

  test "should show ferramenta" do
    get ferramenta_url(@ferramenta)
    assert_response :success
  end

  test "should get edit" do
    get edit_ferramenta_url(@ferramenta)
    assert_response :success
  end

  test "should update ferramenta" do
    patch ferramenta_url(@ferramenta), params: { ferramenta: { codigo: @ferramenta.codigo, descricao: @ferramenta.descricao, observacao: @ferramenta.observacao, quantidade: @ferramenta.quantidade, tipo: @ferramenta.tipo, um: @ferramenta.um } }
    assert_redirected_to ferramenta_url(@ferramenta)
  end

  test "should destroy ferramenta" do
    assert_difference('Ferramenta.count', -1) do
      delete ferramenta_url(@ferramenta)
    end

    assert_redirected_to ferramentas_url
  end
end
