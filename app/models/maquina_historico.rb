class MaquinaHistorico < ApplicationRecord
  extend Enumerize

  # Mesmos statuses de Maquina!
  enumerize :status, in: %w(disponivel executando setup manutencao inativa), default: :disponivel, scope: true

  belongs_to :maquina
  belongs_to :usuario
  belongs_to :pedido_operacao#,  on_delete: :cascade

  scope :with_maquina, -> (maquina_id) { where(maquina_id: maquina_id) }
  scope :with_turno,   -> (turno_id)   { joins(:usuario).where('usuarios.turno_id': turno_id) }
  scope :with_usuario, -> (usuario_id) { where('maquina_historicos.usuario_id': usuario_id) } 
  scope :with_inicio,  -> (inicio)     { where('maquina_historicos.created_at >= ?', inicio.to_datetime.beginning_of_day) }
  scope :with_fim,     -> (fim)        { where('maquina_historicos.created_at <= ?', fim.to_datetime.end_of_day) }
  scope :with_status,  -> (status)     { where(status: status) }

  def minutos
    if segundos
      (segundos / 60.0).round(2)
    else
      0
    end
  end
end
