class Maquina < ApplicationRecord
  include Codigo

  extend Enumerize

  enumerize :status, in: %w(disponivel executando setup manutencao inativa), default: :disponivel, scope: true

  # TODO Remover etapas, está depreciado, agora usamos pedido_operacoes.
  has_many :etapas

  has_and_belongs_to_many :celulas
  validates :descricao, presence: true, uniqueness: true

  has_attached_file :foto
  do_not_validate_attachment_file_type :foto

  has_many :historicos, class_name: 'MaquinaHistorico'

  has_many :pedido_operacoes

  has_many :cronometros

  after_save :update_cronometro

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }

  default_scope -> { order('descricao ASC') }

  def update_status(status, usuario, operacao=nil)
    Maquina.transaction do
      self.update status: status
      historicos.create(status: status, usuario: usuario, pedido_operacao: operacao)
    end
  end


  protected

  def update_cronometro
    if changes[:status]
      antes, depois = changes[:status]

      # Opções: disponivel executando setup manutencao)

      if antes == 'disponivel' and depois == :setup
        self.cronometros.create!(
          tipo:    :pausada,
          motivo:  'Setup',
          inicio:  DateTime.current  
        )
      end

      if antes == 'setup' and depois == :disponivel
        self.cronometros.where(tipo: :pausada, fim: nil).update(fim: DateTime.current)
      end

      if antes == 'disponivel' and depois == :manutencao
        self.cronometros.create!(
          tipo:    :pausada,
          motivo:  "Manutenção",
          inicio:  DateTime.current  
        )
      end

      if antes == 'manutencao' and depois == :disponivel
        self.cronometros.where(tipo: :pausada, fim: nil).update(fim: DateTime.current)
      end
    end
  end
end
