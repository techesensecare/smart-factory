class PedidoOperacoesController < ApplicationController
  include AnexosHelper

  before_action { @menu_painel = true }

  has_scope :with_status
  has_scope :with_descricao
  has_scope :query

  def index
    authorize PedidoOperacao, :index?

    if not params[:with_descricao]
      params[:with_status] ||= 'aguardando'
    end

    @maquina   = Maquina.find_by_id(params[:maquina_id])

    if @maquina
      @operacoes = apply_scopes(@maquina.pedido_operacoes.all)
    else
      @operacoes = apply_scopes(PedidoOperacao.all)
    end

    @hide_top_search = true
  end

  def iniciar_operacao
    @operacao = PedidoOperacao.find(params[:pedido_operacao_id])
    @item = @operacao.pedido_item
    @items_producao = ItemsProducao.new
    # @operacao.quantidade_produzida = @operacao.quantidade_produzida + 1
    # authorize @operacao
    # método comentado para agilizar produção. verificar depois
  end

  def iniciar_operacao_create
    @operacao = PedidoOperacao.find(params[:pedido_operacao_id])
    @items_producao = ItemsProducao.new(items_producao_params)
    
    if @operacao.quantidade_produzida == nil
      @operacao.quantidade_produzida = 0
      @operacao.save
    end


    if @items_producao.save
      flash[:notice] = 'Registrado com sucesso'
      @operacao.quantidade_produzida = @operacao.quantidade_produzida + 1
      @operacao.save
      redirect_to iniciar_operacao_path(pedido_operacao_id: params[:pedido_operacao_id])
    else
      flash[:error] = 'Ocorreu um erro ao tentar processar os dados. Por favor, tente novamente ou contate nosso suporte.'
    end
  end


  def desmembrar
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao
  end

  def sem_maquina
    @operacoes = PedidoOperacao.where(maquina_id: nil)
    authorize PedidoOperacao, :sem_maquina?
  end

  def definir_maquina
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao
  end

  def confirmar_maquina
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @operacao.update_attributes params[:pedido_operacao].permit!
    redirect_to sem_maquina_pedido_operacoes_path
  end

  def confirmar_desmembramento
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @operacao.nova_quantidade  = params[:pedido_operacao][:nova_quantidade]
    @operacao.nova_maquina_id  = params[:pedido_operacao][:nova_maquina_id]
    @operacao.desmembrar
    redirect_to @operacao
  end

  def update_prioridade
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @operacao.update prioridade: params[:prioridade]
    redirect_to operacoes_maquina_path(maquina_id: @operacao.maquina, with_status: @operacao.status)
  end

  def finalizar
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao
  end

  def confirmar_finalizacao
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @operacao.finalizar(params[:pedido_operacao].permit!, current_usuario, @operacao.maquina)
    redirect_to @operacao
  rescue ActiveRecord::RecordInvalid
    render 'finalizar'
  end

  def update_status
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    if params[:status] == 'executando' and !@operacao.maquina.status.disponivel?
      flash[:alert] = 'A máquina não está disponível no momento'
    else
      @operacao.update_status(params[:status], current_usuario, @operacao.maquina, params[:motivo]) 
    end
    redirect_to @operacao
  end

  def show
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @produto  = @operacao.pedido_item.produto
    load_anexos
  end

  def relatorio
    authorize PedidoOperacao, :relatorio?

    @operacoes = apply_scopes(PedidoOperacao.all)
  end

  def items_producao_params
    params.require(:items_producao).permit(:pedido_id, :produto_id, :pedido_item_id, :peso, :unidade, :observacao)
  end
end
