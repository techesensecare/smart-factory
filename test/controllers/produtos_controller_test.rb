require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
    @produto = produtos(:one)
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_produto_url
    assert_response :success
  end

  test "should create produto" do
    assert_difference('Produto.count') do
      post produtos_url, params: { produto: { 
        codigo: '999', 
        descricao: 'Novo produto', 
        materia_prima: @produto.materia_prima, 
        tipo: @produto.tipo 
      } }
    end

    assert_redirected_to produto_url(Produto.reorder('id DESC').first)
  end

  test "should show produto" do
    get produto_url(@produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    patch produto_url(@produto), params: { produto: { codigo: @produto.codigo, descricao: @produto.descricao, materia_prima: @produto.materia_prima, tipo: @produto.tipo } }
    assert_redirected_to produto_url(@produto)
  end

  test "should destroy produto" do
    novo = Produto.create!(codigo: '999', descricao: 'Novo')
    assert_difference('Produto.count', -1) do
      delete produto_url(novo)
    end

    assert_redirected_to produtos_url
  end
end
