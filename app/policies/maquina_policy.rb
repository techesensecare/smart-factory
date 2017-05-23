class MaquinaPolicy < ApplicationPolicy

  def index?
    %w(administrador).include? @user.perfil
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def iniciar_setup?
    %w(administrador pcp operador).include? @user.perfil
  end

  def finalizar_setup?
    %w(administrador pcp operador).include? @user.perfil
  end
end
