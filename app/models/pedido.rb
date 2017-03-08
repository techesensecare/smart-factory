class Pedido < ApplicationRecord
  belongs_to :cliente

  validates :cliente_id, presence: true

  after_create :set_numero

  def set_numero
    numero = "#{created_at.strftime('%Y.%m.%d')}.#{cliente_id}.#{id}"
    update_attributes numero: numero
  end
end
