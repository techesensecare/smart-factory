require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @usuario = usuarios(:alexandre)
    @pedido  = pedidos(:one)
    sign_in @usuario
  end

  test "should get index" do
    get pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: { pedido: { 
        descricao: 'Pedido 1',
        cliente_id: @pedido.cliente_id, 
        numero: @pedido.numero, 
        observacao: @pedido.observacao 
      } }
    end

    assert_redirected_to pedido_url(Pedido.last)
  end

  test "should show pedido" do
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: { pedido: { cliente_id: @pedido.cliente_id, numero: @pedido.numero, observacao: @pedido.observacao } }
    assert_redirected_to pedido_url(@pedido)
  end

  test "should destroy pedido" do
    pedido = Pedido.create!(descricao: 'Novo pedido', cliente_id: @pedido.cliente_id)
    assert_difference('Pedido.count', -1) do
      delete pedido_url(pedido)
    end

    assert_redirected_to pedidos_url
  end

  test "on create should save current user as its responsible" do
    post pedidos_url, params: { pedido: { 
      descricao: 'Pedido 1',
      cliente_id: @pedido.cliente_id, 
      numero: @pedido.numero, 
      observacao: @pedido.observacao 
    } }
    pedido = Pedido.reorder('id DESC').first
    assert_equal @usuario, pedido.responsavel
  end

  test "on update should save current user as its responsible" do
    assert @usuario != @pedido.responsavel
    patch pedido_url(@pedido), params: { pedido: { descricao: 'Nova descrição' } }
    @pedido.reload
    assert @usuario == @pedido.responsavel
  end

  test "should show the script of manufacture" do
    @pedido.update! status: :engenharia

    get detalhar_projeto_pedido_url(@pedido)

    assert_response :success
    assert_select 'h1', /Roteiro de Fabricação/
    assert_select 'label', 'Referente ao item'
    assert_select 'label', 'Ordem'
    assert_select 'label', 'Descrição da operação'
    assert_select 'label', 'Máquina'
    assert_select 'label', 'Status'
    assert_select 'label', 'Tempo de Setup (min)'
    assert_select 'label', 'Tempo de Operação (min)'
    assert_select 'label', 'Quantidade'
    assert_select 'label', 'Ferramentas'
    assert_select 'textarea'
  end

end
