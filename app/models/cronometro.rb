class Cronometro < ApplicationRecord
  extend Enumerize

  enumerize  :tipo, in: %w(executando pausada), scope: true

  belongs_to :pedido_operacao
  belongs_to :maquina

  before_save :update_tempo

  scope :finalizado, -> { where.not(fim: nil) }

  scope :with_maquina,  -> (q) { joins(:maquina).where("maquinas.descricao like '%' || ? || '%'", q)  }
  scope :with_numero,   -> (q) { joins(:pedido_operacao => {:pedido_item => :pedido}).where("pedidos.numero like '%' || ? || '%'", q)  }
  scope :with_operacao, -> (q) { joins(:pedido_operacao).where("pedido_operacoes.descricao like '%' || ? || '%'", q)  }
  scope :with_tipo,     -> (q) { where(tipo: q) }
  scope :with_inicio,   -> (q) { where('inicio >= ?', q) }
  scope :with_fim,      -> (q) { where('fim    <= ?', q) }

  private

    def update_tempo
      if fim?
        self.tempo = (fim - inicio).to_i
      end
    end
end
