class ProdutoPolicy < ApplicationPolicy
  def index?
    %w(administrador engenharia).include? @user.perfil
  end

  def update?
    index?
  end

  def create?
    index?
  end

  def destroy?
    index?
  end
end
