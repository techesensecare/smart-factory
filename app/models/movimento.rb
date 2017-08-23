class Movimento < ApplicationRecord
  extend Enumerize

  enumerize :tipo, in: %w(adicionar remover), scope: true


  scope :with_tipo_peca, -> (tipo) { joins(:produto).where('produtos.tipo' => tipo) }
  scope :with_inicio,    -> (inicio) { where('movimentos.created_at >= ?', inicio.to_datetime.beginning_of_day) }
  scope :with_fim,       -> (fim)    { where('movimentos.created_at <= ?', fim.to_datetime.end_of_day) }

  belongs_to :produto

  validates :produto_id, :tipo, :quantidade, presence: true
  validates :quantidade, numericality: { greater_than: 0 } 

  after_save    :atualizar_saldo_produto
  after_destroy :atualizar_saldo_produto

  def atualizar_saldo_produto
    inclusoes = produto.movimentos.with_tipo(:adicionar).sum(:quantidade)
    remocoes  = produto.movimentos.with_tipo(:remover).sum(:quantidade)
    produto.update saldo: (inclusoes - remocoes).to_i
  end
end
