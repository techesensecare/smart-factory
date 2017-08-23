class Centro < ApplicationRecord
  include Codigo

  validates :descricao, presence: true, uniqueness: true
  has_many :celulas

  scope :with_query, -> (q) { where("descricao ilike '%' || ? || '%'", q) }

  def maquinas
    @maquinas ||= Maquina.joins(:celulas).where('celulas_maquinas.celula_id' => celula_ids).uniq
  end
end
