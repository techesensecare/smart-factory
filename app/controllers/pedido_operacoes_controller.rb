class PedidoOperacoesController < ApplicationController
  include AnexosHelper

  before_action { @menu_painel = true }

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

  def desmembrar
    @operacao = PedidoOperacao.find(params[:id])
  end

  def sem_maquina
    @operacoes = PedidoOperacao.where(maquina_id: nil)
  end

  def definir_maquina
    @operacao = PedidoOperacao.find(params[:id])
  end

  def confirmar_maquina
    @operacao = PedidoOperacao.find(params[:id])
    @operacao.update_attributes params[:pedido_operacao].permit!
    redirect_to sem_maquina_pedido_operacoes_path
  end

  def confirmar_desmembramento
    @operacao = PedidoOperacao.find(params[:id])
    @operacao.nova_quantidade  = params[:pedido_operacao][:nova_quantidade]
    @operacao.nova_maquina_id  = params[:pedido_operacao][:nova_maquina_id]
    @operacao.desmembrar
    redirect_to @operacao
  end

  def update_prioridade
    @operacao = PedidoOperacao.find(params[:id])
    @operacao.update prioridade: params[:prioridade]
    redirect_to operacoes_maquina_path(maquina_id: @operacao.maquina, with_status: @operacao.status)
  end

  def finalizar
    @operacao = PedidoOperacao.find(params[:id])
  end

  def confirmar_finalizacao
    @operacao = PedidoOperacao.find(params[:id])
    @operacao.finalizar(params[:pedido_operacao].permit!, current_usuario, @operacao.maquina)
    redirect_to @operacao
  rescue ActiveRecord::RecordInvalid
    render 'finalizar'
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

  def relatorio
    @operacoes = apply_scopes(PedidoOperacao.all)
  end
end
