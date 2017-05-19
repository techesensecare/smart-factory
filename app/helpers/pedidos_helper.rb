module PedidosHelper
  def prioridade_acima(prioridade)
    if prioridade < 2
      prioridade + 1
    else
      prioridade
    end
  end
  def prioridade_abaixo(prioridade)
    if prioridade > 0
      prioridade - 1
    else
      prioridade
    end
  end
end
