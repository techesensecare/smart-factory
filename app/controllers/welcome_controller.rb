class WelcomeController < ApplicationController
  before_action { @menu_painel = true }

  def index
    @maquinas              = current_usuario.minhas_maquinas.order('descricao ASC')
    @operacoes_sem_estoque = PedidoOperacao.where.not(status: 'finalizada').select {|o| o.alertas.any? }
  end
end
