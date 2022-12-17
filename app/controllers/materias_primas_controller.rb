class MateriasPrimasController < ApplicationController

  def index
    @materias_prima = MateriasPrima.all
  end

  def show
    @materias_prima = MateriasPrima.find(params[:id])
  end

  def new
    #authorize MateriasPrima :error => unable to find policy `MateriasPrimaPolicy` for `MateriasPrima(id: integer, descricao: string, unidade_de_medida: string, tipo: string, saldo: integer)`
    @materias_prima = MateriasPrima.new
    #@materia_prima.descricao = params[:descricao] #pra que isso ta aqui
  end

  def create
    #render plain: params[:materias_prima]
    @materias_prima = MateriasPrima.new(params.require(:materias_prima).permit(:descricao, :unidade_de_medida, :tipo, :saldo))
    if @materias_prima.save
      #redirect_to materias_prima_path(@materia_prima) #ele extrai o ID sozinho
      flash[:alert] = 'Matéria-Prima criada com sucesso.'
      redirect_to @materias_prima
    else
      render 'new'
    end
    
  end
end