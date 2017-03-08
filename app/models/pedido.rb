class Pedido < ApplicationRecord
  belongs_to :cliente

  has_many :etapas, dependent: :delete_all
  accepts_nested_attributes_for :etapas, allow_destroy: true

  validates :cliente_id, presence: true

  after_create :set_numero

  def set_numero
    numero = "#{created_at.strftime('%Y.%m.%d')}.#{cliente_id}.#{id}"
    update_attributes numero: numero
  end
end
