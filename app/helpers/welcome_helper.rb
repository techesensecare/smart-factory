module WelcomeHelper
  def class_maquina(maquina)
    ultima_operacao = maquina.historicos.last.try(:pedido_operacao) 
    return 'bg-danger'  if maquina.status.manutencao?
    return 'bg-danger'  if maquina.status.inativa?
    return 'bg-warning' if maquina.status.setup?
    return 'bg-success' if ultima_operacao.nil?
    return 'bg-danger'  if ultima_operacao.status.pausada?
    return 'bg-warning' if ultima_operacao.status.executando?
    return 'bg-success'
  end

  def status_maquina(maquina)
    ultima_operacao = maquina.historicos.last.try(:pedido_operacao) 
    return 'manutenção'  if maquina.status.manutencao?
    return 'inativa'     if maquina.status.inativa?
    return 'setup'       if maquina.status.setup?
    return 'disponível'  if ultima_operacao.nil?
    return 'pausada'     if ultima_operacao.status.pausada?
    return 'executando'  if ultima_operacao.status.executando?
    return 'disponivel'
  end
end
