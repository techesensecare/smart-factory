class PedidosController < ApplicationController
  before_action { @menu_pedidos = true }
  before_action :set_pedido, only: [:show, :edit, :update, :destroy, :atualizar_status, :detalhar_projeto, :confirmar_detalhes]

  has_scope :with_status
  has_scope :with_descricao

  # GET /pedidos
  # GET /pedidos.json
  def index
    authorize Pedido
    if not params[:with_descricao]
      params[:with_status] ||= 'vendas'
    end

    @pedidos = apply_scopes(Pedido.all)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    authorize @pedido
  end

  # GET /pedidos/new
  def new
    authorize Pedido
    @pedido = Pedido.new
    @pedido.responsavel = current_usuario
  end

  def atualizar_status
    authorize @pedido
    @pedido.update status: params[:status]
    redirect_to @pedido
  end

  # GET /pedidos/1/edit
  def edit
    authorize @pedido
  end

  def detalhar_projeto
    authorize @pedido
    if @pedido.operacoes.blank? 
      @pedido.item_pedidos.each do |item|
        item.produto.todas_operacoes.each do |operacao|
          @pedido.operacoes.build(
            pedido_item: item,
            ordem:       operacao.ordem,
            descricao:   operacao.descricao,
            maquina:     operacao.maquina,
            observacao:  operacao.observacao,
            ferramentas: operacao.ferramentas,
            quantidade:  item.quantidade * operacao.quantidade_materia_prima 
          )
        end
      end
    end
  end

  def confirmar_detalhes
    authorize @pedido
    update
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    authorize Pedido
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    authorize @pedido
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    authorize @pedido
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      # params.require(:pedido).permit(:cliente_id, :numero, :observacao)
      params.require(:pedido).permit!
    end
end
