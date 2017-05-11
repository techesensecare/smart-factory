class Maquina < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(disponivel executando setup manutencao), default: :disponivel, scope: true

  # TODO Remover etapas, está depreciado, agora usamos pedido_operacoes.
  has_many :etapas

  has_and_belongs_to_many :celulas
  validates :descricao, presence: true

  has_attached_file :foto
  do_not_validate_attachment_file_type :foto

  has_many :historicos, class_name: 'MaquinaHistorico'

  has_many :pedido_operacoes

  def update_status(status, usuario, operacao=nil)
    Maquina.transaction do
      self.update status: status
      historicos.create(status: status, usuario: usuario, pedido_operacao: operacao)
    end
  end
end
