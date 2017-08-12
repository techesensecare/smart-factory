class PedidoOperacaoHistorico < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(aguardando na_fila executando pausada finalizada), default: :aguardando, scope: true

  belongs_to :pedido_operacao
  belongs_to :usuario
  belongs_to :maquina

  scope :with_cliente, -> (cliente_id) { joins(:pedido_operacao => :pedido).where('pedidos.cliente_id': cliente_id) }
  scope :with_maquina, -> (maquina_id) { joins(:pedido_operacao).where(maquina_id: maquina_id) }
  scope :with_produto, -> (produto_id) { joins(:pedido_operacao => :pedido_item).where(produto_id: produto_id) } 
  scope :with_turno,   -> (turno_id)   { joins(:usuario).where('usuarios.turno_id': turno_id) }
  scope :with_celula,  -> (celula_id)  { joins(:maquina => :celulas).where('celulas_maquinas.celula_id': celula_id) } 
  scope :with_usuario, -> (usuario_id) { where('pedido_operacao_historicos.usuario_id': usuario_id) } 
  scope :with_inicio,  -> (inicio)     { where('pedido_operacao_historicos.created_at >= ?', inicio.to_datetime.beginning_of_day) }
  scope :with_fim,     -> (fim)        { where('pedido_operacao_historicos.created_at <= ?', fim.to_datetime.end_of_day) }
  scope :with_status,  -> (status)     { where('pedido_operacao_historicos.status = ?', status) }

end
