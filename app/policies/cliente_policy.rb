class ClientePolicy < ApplicationPolicy
  def index?
    %w(administrador vendas).include? @user.perfil
  end

  def create?
    %w(administrador vendas).include? @user.perfil
  end

  def update?
    create?
  end
end
