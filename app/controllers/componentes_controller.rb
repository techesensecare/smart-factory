class ComponentesController < ApplicationController
  def index
  end

  def new
    @componente = Componente.new
  end

  def create
    #authorize Componente
    @componente = Componente.new(componente_params)

    respond_to do |format|
      if @componente.save
        format.html do
          if params[:return_to].present?
            redirect_to params[:return_to], notice: 'Componente cadastrado com sucesso.' 
          else
            redirect_to @componente, notice: 'Componente cadastrado com sucesso.' 
          end
        end
        format.json { render :show, status: :created, location: @componente }
      else
        format.html { render :new }
        format.json { render json: @componente.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def delete
  end

  def componente_params
    params.require(:componente).permit(
      :codigo, 
      :codigo_automatico,
      :descricao,
      :classificacao_fiscal,
      :unidade_medida,
      :tipo,
      :composto,
      {:anexos_attributes => [:id, :tipo, :descricao, :codigo, :revisao, :arquivo, :_destroy]},
      {:materia_primas_attributes => [:id, :produto_id, :produto_usado_id, :quantidade, :_destroy]},
      {:operacoes_attributes => [:id, :ordem, :descricao, :maquina_id, :tempo_setup, :tempo_operacao, {:ferramenta_ids => []}, 
                                 :observacao, :_destroy]}
    )
  end
end
