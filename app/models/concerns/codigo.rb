require 'active_support/concern'

module Codigo
  extend ActiveSupport::Concern

  included do
    validates :codigo, presence: true, unless: :codigo_automatico
    validates :codigo, uniqueness: true
    after_save :gerar_codigo, if: "codigo_automatico and codigo.blank?"

    scope :order_by_codigo, -> { reorder("lpad(codigo, 5, '0') ASC") }

    def gerar_codigo
      self.update_attribute :codigo, self.id.to_s
    end

    # Permite a criação de métodos como codigo_nome ou codigo_descricao
    # ou qualquer outra combinação com código, retornando a concatenação
    # dois dois campos.
    
    def method_missing(name, *args)
      if name.to_s.include?("codigo_")
        field = name.to_s.split("_").last
        "#{ codigo } - #{ send(field) }"
      else
        super name, *args
      end
    end
  end
end
