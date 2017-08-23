class WelcomeController < ApplicationController
  before_action { @menu_painel = true }

  def index
    if policy(PedidoOperacao).index?
      redirect_to action: :painel
    else
      redirect_to pedidos_path
    end
  end

  def painel
    @maquinas              = current_usuario.minhas_maquinas.order('descricao ASC')
    @operacoes_sem_estoque = PedidoOperacao.where.not(status: 'finalizada').select {|o| o.alertas.any? }
    @operacoes_sem_maquina = PedidoOperacao.where(maquina_id: nil)
  end

  def painel_fabrica
    @menu_painel = false
    @menu_painel_fabrica = true

    @maquinas = Maquina.all
    @maquinas = @maquinas.sort_by do |m|
      # TODO
    end

    render layout: 'painel'
  end
end
