class PedidoOperacoesController < ApplicationController
  before_action { @menu_pedidos = true }

  has_scope :with_status
  has_scope :with_descricao

  def index
    if not params[:with_descricao]
      params[:with_status] ||= 'aguardando'
    end

    @operacoes = apply_scopes(PedidoOperacao.all)
  end
end
