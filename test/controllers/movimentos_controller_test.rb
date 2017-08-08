require 'test_helper'

class MovimentosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in usuarios(:alexandre)
    @movimento = movimentos(:one)
    @produto = @movimento.produto
  end

  test "should get index" do
    get produto_movimentos_url(@produto)
    assert_response :success
  end

  test "should get new" do
    get new_produto_movimento_url(@produto)
    assert_response :success
  end

  test "should create movimento" do
    assert_difference('Movimento.count') do
      post produto_movimentos_url(@produto), params: { movimento: { produto_id: @movimento.produto_id, quantidade: @movimento.quantidade, tipo: @movimento.tipo } }
    end

    assert_redirected_to produto_movimentos_url(@produto)
  end

  test "should get edit" do
    get edit_produto_movimento_url(@produto, @movimento)
    assert_response :success
  end

  test "should update movimento" do
    patch produto_movimento_url(@produto, @movimento), params: { movimento: { produto_id: @movimento.produto_id, quantidade: @movimento.quantidade, tipo: @movimento.tipo } }
    assert_redirected_to produto_movimentos_url(@produto)
  end

  test "should destroy movimento" do
    assert_difference('Movimento.count', -1) do
      delete produto_movimento_url(@produto, @movimento)
    end

    assert_redirected_to produto_movimentos_url(@produto)
  end
end
