class CronometroPolicy < ApplicationPolicy
  def index?
    true
    %w(administrador pcp operador).include? @user.perfil
  end
end
