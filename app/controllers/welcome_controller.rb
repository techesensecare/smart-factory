class WelcomeController < ApplicationController
  def index
    @maquinas = current_usuario.minhas_maquinas.order('descricao ASC')
  end
end
