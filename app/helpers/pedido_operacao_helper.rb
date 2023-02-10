module PedidoOperacaoHelper
  def to_upcase(value)
    if value == 'Pcp'
      value = value.upcase
    end
    value
  end
end