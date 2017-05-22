class CronometrosController < ApplicationController
  before_filter { @menu_relatorios = true } 
  has_scope :with_maquina
  has_scope :with_numero
  has_scope :with_operacao
  has_scope :with_tipo
  has_scope :with_inicio
  has_scope :with_fim

  def index
    @cronometros = apply_scopes(Cronometro)
  end
end
