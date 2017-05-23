class CelulasController < ApplicationController
  before_action { authorize :admin }
  before_action { @configuracoes = true }
  before_action :set_celula, only: [:show, :edit, :update, :destroy]

  # GET /celulas
  # GET /celulas.json
  def index
    @celulas = Celula.all
  end

  # GET /celulas/1
  # GET /celulas/1.json
  def show
  end

  # GET /celulas/new
  def new
    @celula = Celula.new
  end

  # GET /celulas/1/edit
  def edit
  end

  # POST /celulas
  # POST /celulas.json
  def create
    @celula = Celula.new(celula_params)

    respond_to do |format|
      if @celula.save
        format.html { redirect_to @celula, notice: 'Celula was successfully created.' }
        format.json { render :show, status: :created, location: @celula }
      else
        format.html { render :new }
        format.json { render json: @celula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /celulas/1
  # PATCH/PUT /celulas/1.json
  def update
    respond_to do |format|
      if @celula.update(celula_params)
        format.html { redirect_to @celula, notice: 'Celula was successfully updated.' }
        format.json { render :show, status: :ok, location: @celula }
      else
        format.html { render :edit }
        format.json { render json: @celula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /celulas/1
  # DELETE /celulas/1.json
  def destroy
    @celula.destroy
    respond_to do |format|
      format.html { redirect_to celulas_url, notice: 'Celula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_celula
      @celula = Celula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def celula_params
      params.require(:celula).permit(:descricao, :centro_id, maquina_ids: [])
    end
end
