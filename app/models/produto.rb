class Produto < ApplicationRecord
  include Codigo

  extend Enumerize

  enumerize :tipo, in: [:fabricado, :comprado, :comprado_fabricado], default: :comprado
  enumerize :unidade_medida, in: [:unidade, :kg, :grama, :m, :m2, :cm, :mm, :polegada, :l, :ml], default: :unidade

  validates :tipo, :descricao, :tipo, :unidade_medida,  presence: true

  scope :with_tipo, -> (tipo) { where(tipo: tipo) }

  has_many :anexos, as: :anexavel
  accepts_nested_attributes_for :anexos, :allow_destroy => true

  has_many :sub_produtos
  has_many :componentes
  has_many :materias_primas
  has_one :embalagens

  has_many :materia_primas
  accepts_nested_attributes_for :materia_primas, :allow_destroy => true

  has_many :operacoes
  accepts_nested_attributes_for :operacoes, :allow_destroy => true

  validates :descricao, uniqueness: true

  has_many :movimentos

  default_scope { order('descricao ASC') }

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }

  scope :materias_primas, -> { where("composto = ?", true) }

  scope :por_descricao, -> { order('descricao ASC') }

  before_save :update_itens

  def update_itens 
    ItemPedido.where(descricao_produto: self.descricao).update(produto_id: self.id)
  end

  # WIP
  #
  # def saldo_necessario
  #   PedidoOperacao.
  #     joins(:pedido_item => { :produto => :materia_primas }).
  #     where("item_pedidos.produto_id" => 1).
  #     where("item_pedidos.quantidade * materia_primas. > produtos.saldo")
  # end

  def todas_operacoes
    operacoes_do_produto = self.operacoes
    operacoes_do_produto = operacoes_do_produto.order('ordem ASC')
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
