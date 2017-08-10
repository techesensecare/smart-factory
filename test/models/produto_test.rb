require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  test "#todas_operacoes deveria trazer as operações do produto e de suas matérias primas" do
    produto = produtos(:acento)
    assert produto.materia_primas.any?
    assert_equal(
      [
        operacoes(:pintar_acento), 
        operacoes(:cortar_tecido_acento)
      ], 
      produto.todas_operacoes)
  end
end
