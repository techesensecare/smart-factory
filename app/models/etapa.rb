class Etapa < ApplicationRecord
  belongs_to :maquina
  belongs_to :pedido

  scope :pendente,   -> { where(data_entrega: nil) } 
  scope :finalizada, -> { where("data_entrega is not null") } 

  validates :maquina_id, :descricao, :quantidade, presence: true
end
