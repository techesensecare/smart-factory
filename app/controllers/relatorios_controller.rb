class RelatoriosController < ApplicationController
  before_action { @menu_relatorios = true }

  has_scope :with_cliente
  has_scope :with_centro
  has_scope :with_maquina
  has_scope :with_turno
  has_scope :with_celula
  has_scope :with_usuario
  has_scope :with_inicio
  has_scope :with_fim
  has_scope :with_status
  has_scope :with_numero
  has_scope :with_parada
  has_scope :with_tipo
  has_scope :with_tipo_peca
  has_scope :with_query

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
    scope       = PedidoOperacaoHistorico.where(status: [:executando, :setup])
    @historicos = apply_scopes(scope).page params[:page]
    @usuarios   = @historicos.group_by { |h| h.usuario }.sort
  end

  def usuarios_tempo_ocioso
    scope       = PedidoOperacaoHistorico.where(status: :pausada)
    @historicos = apply_scopes(scope).page params[:page]
    @usuarios   = @historicos.group_by { |h| h.usuario }.sort
  end

  def usuarios_rejeitos
    scope     = PedidoOperacaoRejeito
    @rejeitos = apply_scopes(scope).page params[:page]
    @usuarios = @rejeitos.group_by { |h| h.usuario }.sort
  end

  def producao
    # TODO Melhorar performance dessas somas.

    query = apply_scopes(PedidoOperacaoHistorico.where(status: [:executando])).all
    @pedidos  = query.group_by {|i| i.pedido_operacao.pedido }.sort_by { |_, itens| itens.sum(&:minutos).round(2) }.reverse
    @maquinas = query.group_by {|i| i.maquina }.sort_by { |_, itens| itens.sum(&:minutos).round(2) }.reverse
    @usuarios = query.group_by {|i| i.usuario }.sort_by { |_, itens| itens.sum(&:minutos).round(2) }.reverse
    @centros  = query.group_by {|i| i.maquina.celulas.first.try(:centro) }.sort_by { |_, itens| itens.sum(&:minutos).round(2) }.reverse
  end

  def estoque
    @pecas = apply_scopes(Produto).all
  end

  def uso_de_pecas
    scope = Movimento.select(:produto_id).select("sum(quantidade) quantidade").where(tipo: :remover).group(:produto_id)
    @mais_usadas  = apply_scopes(scope.order('quantidade DESC').limit(5))
    @menos_usadas = apply_scopes(scope.order('quantidade ASC').limit(5))
  end

  def centro_de_trabalho
    @centros = Centro.order('descricao ASC').map do |centro|
      maquinas = Maquina.joins(:celulas).where('celulas_maquinas.celula_id' => centro.celula_ids).uniq
      total_e  = 0
      total_p  = 0

      maquinas = maquinas.map do |m|
        execucao = apply_scopes(m.historicos.where(status: [:executando])).sum(:segundos).to_i
        paradas  = apply_scopes(m.pedido_operacoes_historicos.where(status: [:pausada])).sum(:segundos).to_i

        execucao = execucao / (60) # horas
        paradas  = paradas  / (60) # horas

        total_e += execucao
        total_p += paradas

        [m, execucao, paradas]
      end

      [centro, maquinas, total_e, total_p]
    end
  end
end
