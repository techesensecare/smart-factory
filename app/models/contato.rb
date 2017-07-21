class Contato < ApplicationRecord
  include Enderecos

  belongs_to :cliente
  belongs_to :fornecedor

  validates :nome, presence: true

  def descricao
    desc = nome
    desc << ' - ' + cargo if cargo.present?
    desc << '/' + departamento if departamento.present?
    desc
  end
end
