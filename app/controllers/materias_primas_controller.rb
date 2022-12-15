class MateriasPrimasController < ApplicationController

  def index
    @materias_prima = MateriasPrima.all
  end

  def show
    @materias_prima = MateriasPrima.find(params[:id])
  end

  def new

  end

  def create

  end
end