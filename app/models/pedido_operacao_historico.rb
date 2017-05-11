class PedidoOperacaoHistorico < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(aguardando na_fila executando pausada finalizada), default: :aguardando, scope: true

  belongs_to :pedido_operacao
  belongs_to :usuario
  belongs_to :maquina
end
