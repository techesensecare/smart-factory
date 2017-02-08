class TerminaisController < ApplicationController
  before_action { @configuracoes = true }
  before_action :set_terminal, only: [:show, :edit, :update, :destroy]

  # GET /terminais
  # GET /terminais.json
  def index
    @terminais = Terminal.all
  end

  # GET /terminais/1
  # GET /terminais/1.json
  def show
  end

  # GET /terminais/new
  def new
    @terminal = Terminal.new
  end

  # GET /terminais/1/edit
  def edit
  end

  # POST /terminais
  # POST /terminais.json
  def create
    @terminal = Terminal.new(terminal_params)

    respond_to do |format|
      if @terminal.save
        format.html { redirect_to terminais_path, notice: 'Terminal was successfully created.' }
        format.json { render :show, status: :created, location: @terminal }
      else
        format.html { render :new }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terminais/1
  # PATCH/PUT /terminais/1.json
  def update
    respond_to do |format|
      if @terminal.update(terminal_params)
        format.html { redirect_to terminais_path, notice: 'Terminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @terminal }
      else
        format.html { render :edit }
        format.json { render json: @terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terminais/1
  # DELETE /terminais/1.json
  def destroy
    @terminal.destroy
    respond_to do |format|
      format.html { redirect_to terminais_url, notice: 'Terminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terminal
      @terminal = Terminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def terminal_params
      params.require(:terminal).permit(:descricao, :maquina_ids => [])
    end
end
