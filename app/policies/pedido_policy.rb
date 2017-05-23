class PedidoPolicy < ApplicationPolicy
  def index?
    %w(administrador vendas engenharia pcp).include? @user.perfil
  end

  def atualizar_status?
    %w(administrador vendas engenharia pcp operador).include? @user.perfil
  end

  def create?
    %w(administrador vendas).include? @user.perfil
  end

  def detalhar_projeto?
    %w(administrador engenharia).include?(@user.perfil) and @record.status.engenharia?
  end

  def confirmar_detalhes?
    detalhar_projeto?
  end

  def update?
    # Administrador pode querer mudar coisas como o prazo.
    return true if 'administrador' == @user.perfil

    %w(administrador vendas).include?(@user.perfil) and @record.status.vendas?
  end
end
