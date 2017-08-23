class PedidoOperacaoRejeito < ApplicationRecord
  belongs_to :pedido_operacao
  belongs_to :rejeito
  belongs_to :usuario

  scope :with_usuario, -> (usuario_id) { where(usuario_id: usuario_id) } 
  scope :with_turno,   -> (turno_id)   { joins(:usuario).where('usuarios.turno_id': turno_id) }
  scope :with_inicio,  -> (inicio)     { where('pedido_operacao_rejeitos.created_at >= ?', inicio.to_datetime.beginning_of_day) }
  scope :with_fim,     -> (fim)        { where('pedido_operacao_rejeitos.created_at <= ?', fim.to_datetime.end_of_day) }

  validates :quantidade, :rejeito_id, presence: true
end
