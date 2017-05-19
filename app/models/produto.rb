class Produto < ApplicationRecord
  extend Enumerize

  enumerize :tipo, in: [:fabricado, :comprado, :comprado_fabricado], default: :comprado
  enumerize :unidade_medida, in: [:unidade, :kg, :l, :m2], default: :unidade

  validates :tipo, :descricao, :codigo, :tipo, :unidade_medida,  presence: true

  has_many :anexos, as: :anexavel
  accepts_nested_attributes_for :anexos, :allow_destroy => true

  has_many :materia_primas
  accepts_nested_attributes_for :materia_primas, :allow_destroy => true

  has_many :operacoes
  accepts_nested_attributes_for :operacoes, :allow_destroy => true

  validates :descricao, :codigo, uniqueness: true

  has_many :movimentos


  before_save :update_itens

  def update_itens 
    ItemPedido.where(descricao_produto: self.descricao).update(produto_id: self.id)
  end

  def todas_operacoes
    operacoes_do_produto = self.operacoes
    operacoes_do_produto.each do |o|
      o.quantidade_materia_prima = 1
    end
    
    operacoes_de_materia_prima = materia_primas.map do |i| 
      ops = i.produto_usado.operacoes
      ops.each do |o|
        o.quantidade_materia_prima = i.quantidade.to_i
      end
      ops
    end

    (operacoes_do_produto + operacoes_de_materia_prima).flatten
  end

end
