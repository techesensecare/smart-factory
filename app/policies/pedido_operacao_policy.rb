class PedidoOperacaoPolicy < ApplicationPolicy

  # Gerais

  def index?
    %w(administrador pcp operador).include? @user.perfil
  end

  def relatorio?
    %w(administrador pcp operador).include? @user.perfil
  end

  def sem_maquina?
    %w(administrador pcp operador).include? @user.perfil
  end


  # Operações do PCP

  def update_prioridade?
    %w(administrador pcp).include? @user.perfil
  end

  def enviar_para_fila?
    %w(administrador pcp).include?(@user.perfil) and
      @record.status.PCP?
  end

  def definir_maquina?
    %w(administrador pcp).include?(@user.perfil)
  end

  def confirmar_maquina?
    definir_maquina?
  end


  # Alterações do Operador

  def desmembrar?
    %w(administrador pcp operador).include?(@user.perfil) and
      (@record.status.na_fila? or @record.status.pausada?)
  end

  def confirmar_desmembramento?
    desmembrar?
  end

  def update_status?
    %w(administrador pcp operador).include?(@user.perfil)
  end

  def iniciar?
    %w(administrador pcp operador).include?(@user.perfil) and
      (@record.status.na_fila?)
  end

  def pausar?
    %w(administrador pcp operador).include?(@user.perfil) and
      (@record.status.executando?)
  end

  def finalizar?
    %w(administrador pcp operador).include?(@user.perfil) and
      (@record.status.executando?)
  end

  def confirmar_finalizacao?
    finalizar?
  end

  def continuar?
    %w(administrador pcp operador).include?(@user.perfil) and
      (@record.status.pausada?)
  end
end
