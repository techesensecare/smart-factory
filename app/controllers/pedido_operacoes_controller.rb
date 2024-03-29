class PedidoOperacoesController < ApplicationController
  include AnexosHelper

  before_action { @menu_painel = true }

  has_scope :with_status
  has_scope :with_descricao
  has_scope :query

  def index
    authorize PedidoOperacao, :index?


    if not params[:with_descricao]
      params[:with_status] ||= 'Pcp'
    end

    @maquina   = Maquina.find_by_id(params[:maquina_id])

    if @maquina
      @operacoes = apply_scopes(@maquina.pedido_operacoes.all)
      #@pedidos = apply_scopes(Pedido.all)
    else
      @operacoes = apply_scopes(PedidoOperacao.all)
      #@pedidos = apply_scopes(Pedido.all)
    end

    @hide_top_search = true
  end

  def iniciar_operacao
    @operacao = PedidoOperacao.find(params[:pedido_operacao_id])
    @produto_id = MateriaPrima.find(@operacao.pedido_item_id).produto_id
    @operacao.produto_id = @produto_id
    @item = MateriaPrima.find(@operacao.pedido_item_id).produto_usado
    @items_producao = ItemsProducao.new
    @unidade_medida = MateriaPrima.find(@operacao.pedido_item_id).produto_usado.unidade_medida
    # @operacao.quantidade_produzida = @operacao.quantidade_produzida + 1
    # authorize @operacao
    # método comentado para agilizar produção. verificar depois

    @pesos = ItemsProducao.where(operacao_id: @operacao.id).all
  end

  def iniciar_operacao_create
    @operacao = PedidoOperacao.find(params[:pedido_operacao_id])
    @items_producao = ItemsProducao.new(items_producao_params)
    
    if @operacao.quantidade_produzida == nil
      @operacao.quantidade_produzida = 0
      @operacao.save
    end

    peso = @items_producao.peso

    tolerancias = MateriaPrima.find(@items_producao.pedido_item_id)
    tolerancia_inferior = tolerancias.tolerancia_inferior
    tolerancia_superior = tolerancias.tolerancia_superior

    #byebug

    if peso == nil
      redirect_to iniciar_operacao_path(pedido_operacao_id: params[:pedido_operacao_id])
      return
    end

    if peso.between?(tolerancia_inferior, tolerancia_superior)
      [result = true]
    else
      [result = false]
    end

    if result == true and @items_producao.save
      flash[:notice] = 'Registrado com sucesso'
      @operacao.quantidade_produzida = @operacao.quantidade_produzida + 1
      @operacao.save

      if @operacao.quantidade_produzida == @operacao.quantidade 
        redirect_to operacao_finalizada_path(pedido_operacao_id:params[:pedido_operacao_id])
      else
        redirect_to iniciar_operacao_path(pedido_operacao_id: params[:pedido_operacao_id])
      end
    else
      flash[:error] = 'Ocorreu um erro ao tentar processar os dados. Por favor, tente novamente ou contate nosso suporte.'
      redirect_to travar_operacao_path
    end
  end


  def operacao_finalizada
    @operacao = PedidoOperacao.find(params[:pedido_operacao_id])
    @operacao.status = 'finalizada'
    @operacao.save
  end

  def apagar_operacoes
    PedidoOperacao.where(status:'finalizada').destroy_all
    redirect_to request.referer || root_path
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
    authorize @operacao, @maquina
    
    #@maquina   = Maquina.find_by_id(params[:maquina_id])

    if params[:status] == 'executando' and !@operacao.maquina.status.disponivel?
      flash[:alert] = 'A máquina não está disponível no momento'
    else
      if params[:status] == 'na_fila'
        @operacao.status = 'executando'
        @operacao.save
      else
        @operacao.update_status(params[:status], current_usuario, @operacao.maquina, params[:motivo]) 
      end
    end
    redirect_to request.referer || root_path
  end

  def show
    @operacao = PedidoOperacao.find(params[:id])
    authorize @operacao

    @produto  = MateriaPrima.find(@operacao.pedido_item_id).produto_usado
    load_anexos
  end

  def relatorio
    authorize PedidoOperacao, :relatorio?

    @operacoes = apply_scopes(PedidoOperacao.all)
  end

  def items_producao_params
    params.require(:items_producao).permit(:operacao_id, :pedido_id, :produto_id, :pedido_item_id, :peso, :unidade, :observacao)
  end



  #def registrar_operacoes_mr_taste
    
  #end
end