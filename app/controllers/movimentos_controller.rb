class MovimentosController < ApplicationController
  before_action :set_movimento, only: [:show, :edit, :update, :destroy]
  before_action :set_produto

  # GET /movimentos
  # GET /movimentos.json
  def index
    @movimentos = @produto.movimentos.order('created_at DESC').all
  end

  # GET /movimentos/1
  # GET /movimentos/1.json
  def show
  end

  # GET /movimentos/new
  def new
    @movimento = Movimento.new
    @movimento.produto = @produto
    @movimento.tipo    = params[:tipo]
  end

  # GET /movimentos/1/edit
  def edit
  end

  # POST /movimentos
  # POST /movimentos.json
  def create
    @movimento = Movimento.new(movimento_params)

    respond_to do |format|
      if @movimento.save
        format.html { redirect_to produto_movimentos_path(@movimento.produto), notice: 'Operação incluída con sucesso' }
        format.json { render :show, status: :created, location: @movimento }
      else
        format.html { render :new }
        format.json { render json: @movimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimentos/1
  # PATCH/PUT /movimentos/1.json
  def update
    respond_to do |format|
      if @movimento.update(movimento_params)
        format.html { redirect_to produto_movimentos_path(@movimento.produto), notice: 'Operação atualizada.' }
        format.json { render :show, status: :ok, location: @movimento }
      else
        format.html { render :edit }
        format.json { render json: @movimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimentos/1
  # DELETE /movimentos/1.json
  def destroy
    @movimento.destroy
    respond_to do |format|
      format.html { redirect_to produto_movimentos_url(@movimento.produto), notice: 'Operação deletada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_produto
      @produto = Produto.find(params[:produto_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_movimento
      @movimento = Movimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimento_params
      params.require(:movimento).permit(:produto_id, :tipo, :quantidade, :observacao)
    end
end
