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
  has_scope :with_parada

  def pedidos
    @historicos = apply_scopes(PedidoOperacaoHistorico.order('created_at ASC')).page params[:page]
  end

  def maquinas
    @historicos = apply_scopes(MaquinaHistorico.order('created_at ASC')).page params[:page]
  end

  def maquinas_futuro
    @maquinas = apply_scopes(Maquina.order('descricao ASC')).page params[:page]
  end

  def maquinas_paradas
    @historicos = apply_scopes(PedidoOperacaoHistorico.where(status: :pausada).order('created_at ASC')).page params[:page]
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
