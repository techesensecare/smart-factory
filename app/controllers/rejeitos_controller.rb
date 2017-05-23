class RejeitosController < ApplicationController
  before_action { authorize :admin }
  before_action { @configuracoes = true }
  before_action :set_rejeito, only: [:show, :edit, :update, :destroy]

  # GET /rejeitos
  # GET /rejeitos.json
  def index
    @rejeitos = Rejeito.all
  end

  # GET /rejeitos/1
  # GET /rejeitos/1.json
  def show
  end

  # GET /rejeitos/new
  def new
    @rejeito = Rejeito.new
  end

  # GET /rejeitos/1/edit
  def edit
  end

  # POST /rejeitos
  # POST /rejeitos.json
  def create
    @rejeito = Rejeito.new(rejeito_params)

    respond_to do |format|
      if @rejeito.save
        format.html { redirect_to @rejeito, notice: 'Rejeito was successfully created.' }
        format.json { render :show, status: :created, location: @rejeito }
      else
        format.html { render :new }
        format.json { render json: @rejeito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rejeitos/1
  # PATCH/PUT /rejeitos/1.json
  def update
    respond_to do |format|
      if @rejeito.update(rejeito_params)
        format.html { redirect_to @rejeito, notice: 'Rejeito was successfully updated.' }
        format.json { render :show, status: :ok, location: @rejeito }
      else
        format.html { render :edit }
        format.json { render json: @rejeito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rejeitos/1
  # DELETE /rejeitos/1.json
  def destroy
    @rejeito.destroy
    respond_to do |format|
      format.html { redirect_to rejeitos_url, notice: 'Rejeito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rejeito
      @rejeito = Rejeito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rejeito_params
      params.require(:rejeito).permit(:descricao)
    end
end
