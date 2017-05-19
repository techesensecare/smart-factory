class WelcomeController < ApplicationController
  before_action { @menu_painel = true }

  def index
    @maquinas = current_usuario.minhas_maquinas.order('descricao ASC')
  end
end
