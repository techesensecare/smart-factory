class MateriasPrimasController < ApplicationController

  def index
    @materias_prima = MateriasPrima.all
  end

  def show
    @materias_prima = MateriasPrima.find(params[:id])
  end

  def new
    #authorize MateriasPrima :error => unable to find policy `MateriasPrimaPolicy` for `MateriasPrima(id: integer, descricao: string, unidade_de_medida: string, tipo: string, saldo: integer)`
    @materia_prima = MateriasPrima.new
    #@materia_prima.descricao = params[:descricao] #pra que isso ta aqui
  end

  def create

  end
end