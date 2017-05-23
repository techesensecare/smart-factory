class MaquinaPolicy < ApplicationPolicy
  def iniciar_setup?
    %w(administrador pcp operador).include? @user.perfil
  end

  def finalizar_setup?
    %w(administrador pcp operador).include? @user.perfil
  end
end
