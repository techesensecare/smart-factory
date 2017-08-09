require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  test "should save the historic of changes" do
    pedido = Pedido.create!(
      cliente:     clientes(:one),
      descricao:   "Novo pedido",
      numero:      '9999',
      responsavel: usuarios(:alexandre)
    )

    assert pedido.versions.any?
  end
end
