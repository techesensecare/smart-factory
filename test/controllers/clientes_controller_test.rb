require 'test_helper'

class ClientesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
    @cliente = clientes(:one)
  end

  test "should get index" do
    get clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_cliente_url
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post clientes_url, params: { 
        cliente: { 
          codigo: '999',
          email: 'lopes@email.com', 
          endereco: 'NYC', 
          nome: 'Lucas Lopes', 
          telefone: ''
        }  
      }
    end

    assert_redirected_to cliente_url(Cliente.last)
  end

  test "should show cliente" do
    get cliente_url(@cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_cliente_url(@cliente)
    assert_response :success
  end

  test "should update cliente" do
    patch cliente_url(@cliente), params: { 
      cliente: { 
        email: @cliente.email, 
        endereco: @cliente.endereco, 
        nome: @cliente.nome, 
        telefone: @cliente.telefone 
      } 
    }
    assert_redirected_to cliente_url(@cliente)
  end

  test "should destroy cliente if it has not pedidos" do
    @cliente.pedidos.delete_all

    assert_difference('Cliente.count', -1) do
      delete cliente_url(@cliente)
    end

    assert_redirected_to clientes_url
  end

  test "should not destroy cliente if it has not pedidos" do
    assert @cliente.pedidos.any?

    assert_difference('Cliente.count', 0) do
      delete cliente_url(@cliente)
    end

    assert_redirected_to root_url
  end
end
