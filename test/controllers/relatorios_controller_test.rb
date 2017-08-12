require 'test_helper'

class RelatoriosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @usuario = usuarios(:alexandre)
    sign_in @usuario
  end

  test "should get pedidos" do
    get relatorios_pedidos_url
    assert_response :success
  end

  test "should get maquinas" do
    get relatorios_maquinas_url
    assert_response :success
  end

  test "should get usuarios" do
    get relatorios_usuarios_url
    assert_response :success
  end

  test "should get producao" do
    get relatorios_producao_url
    assert_response :success
  end

  test "should get estoque" do
    get relatorios_estoque_url
    assert_response :success
  end

  test "should get centro_de_trabalho" do
    get relatorios_centro_de_trabalho_url
    assert_response :success
  end

end
