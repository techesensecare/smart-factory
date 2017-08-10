require 'test_helper'

class MaquinasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
    @maquina = maquinas(:one)
  end

  test "should get index" do
    get maquinas_url
    assert_response :success
  end

  test "should get new" do
    get new_maquina_url
    assert_response :success
  end

  test "should create maquina" do
    assert_difference('Maquina.count') do
      post maquinas_url, params: { maquina: { codigo: '999', descricao: 'Nova Máquina' } }
    end

    assert_redirected_to maquinas_url
  end

  test "should show maquina" do
    get maquina_url(@maquina)
    assert_response :success
  end

  test "should get edit" do
    get edit_maquina_url(@maquina)
    assert_response :success
  end

  test "should update maquina" do
    patch maquina_url(@maquina), params: { maquina: { descricao: 'Nova Descrição' } }
    assert_redirected_to maquinas_url
  end

  test "should destroy maquina if it has not dependents" do
    m = Maquina.create! descricao: 'Nova Máquina'

    assert_difference('Maquina.count', -1) do
      delete maquina_url(m)
    end

    assert_redirected_to maquinas_url
  end
end
