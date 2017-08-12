class RelatoriosController < ApplicationController
  before_action { @menu_relatorios = true }

  has_scope :with_cliente
  has_scope :with_maquina
  has_scope :with_turno
  has_scope :with_celula
  has_scope :with_usuario
  has_scope :with_inicio
  has_scope :with_fim
  has_scope :with_status
  has_scope :with_numero

  def pedidos
    @historicos = apply_scopes(PedidoOperacaoHistorico.order('created_at ASC'))
  end

  def maquinas
  end

  def usuarios
  end

  def producao
  end

  def estoque
  end

  def centro_de_trabalho
  end
end
