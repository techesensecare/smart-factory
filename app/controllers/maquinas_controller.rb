class MaquinasController < ApplicationController
  before_action { authorize Maquina }
  before_action { @configuracoes = true }
  before_action :set_maquina, only: [:show, :edit, :update, :destroy, :monitor]

  has_scope :with_status

  # GET /maquinas
  # GET /maquinas.json
  def index
    @maquinas = apply_scopes(Maquina.order('descricao ASC'))
  end

  # GET /maquinas/1
  # GET /maquinas/1.json
  def show
  end

  # GET /maquinas/new
  def new
    @maquina = Maquina.new
  end

  # GET /maquinas/1/edit
  def edit
  end

  # POST /maquinas
  # POST /maquinas.json
  def create
    @maquina = Maquina.new(maquina_params)

    respond_to do |format|
      if @maquina.save
        format.html { redirect_to maquinas_path, notice: 'Máquina cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @maquina }
      else
        format.html { render :new }
        format.json { render json: @maquina.errors, status: :unprocessable_entity }
      end
    end
  end

  def monitor
    @operacoes = apply_scopes(@maquina.pedido_operacoes)
  end

  def finalizar_setup
    policy Maquina
    @maquina = Maquina.find(params[:id])
    @maquina.update_status :disponivel, current_usuario
    redirect_back(fallback_location: root_path)
  end

  def iniciar_setup
    policy Maquina
    @maquina = Maquina.find(params[:id])
    @maquina.update_status :setup, current_usuario
    redirect_back(fallback_location: root_path)
  end

  # Depreciado
  def finalizar
    @maquina = Maquina.find(params[:id])
    Etapa.where(id: params[:etapa]).update_all data_entrega: Date.today
    redirect_to @maquina
  end

  # PATCH/PUT /maquinas/1
  # PATCH/PUT /maquinas/1.json
  def update
    respond_to do |format|
      if @maquina.update(maquina_params)
        format.html { redirect_to maquinas_path, notice: 'Maquina was successfully updated.' }
        format.json { render :show, status: :ok, location: @maquina }
      else
        format.html { render :edit }
        format.json { render json: @maquina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maquinas/1
  # DELETE /maquinas/1.json
  def destroy
    @maquina.destroy
    respond_to do |format|
      format.html { redirect_to maquinas_url, notice: 'Maquina was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maquina
      @maquina = Maquina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maquina_params
      # params.require(:maquina).permit(:descricao)
      params.require(:maquina).permit!
    end
end
