class MaquinaHistorico < ApplicationRecord
  belongs_to :maquina
  belongs_to :usuario
  belongs_to :pedido_operacao
end
