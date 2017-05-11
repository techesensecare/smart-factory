class PedidoOperacoesController < ApplicationController
  include AnexosHelper

  before_action { @menu_pedidos = true }

  has_scope :with_status
  has_scope :with_descricao
  has_scope :query

  def index
    if not params[:with_descricao]
      params[:with_status] ||= 'aguardando'
    end

    @maquina   = Maquina.find_by_id(params[:maquina_id])

    if @maquina
      @operacoes = apply_scopes(@maquina.pedido_operacoes.all)
    else
      @operacoes = apply_scopes(PedidoOperacao.all)
    end
  end

  def update_status
    @operacao = PedidoOperacao.find(params[:id])
    if params[:status] == 'executando' and !@operacao.maquina.status.disponivel?
      flash[:alert] = 'A máquina não está disponível no momento'
    else
      @operacao.update_status(params[:status], current_usuario, @operacao.maquina, params[:motivo]) 
    end
    redirect_to @operacao
  end

  def show
    @operacao = PedidoOperacao.find(params[:id])
    @produto  = @operacao.pedido_item.produto
    load_anexos
  end
end
