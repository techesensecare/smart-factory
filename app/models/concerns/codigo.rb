require 'active_support/concern'

module Codigo
  extend ActiveSupport::Concern

  included do
    validates :codigo, presence: true, unless: :codigo_automatico
    validates :codigo, uniqueness: true
    after_save :gerar_codigo, if: "codigo_automatico and codigo.blank?"

    def gerar_codigo
      self.update_attribute :codigo, self.id.to_s
    end
  end
end
