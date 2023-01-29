class ItemsProducao < ApplicationRecord
  belongs_to :pedido, # polymorphic: true
  belongs_to :pedido_item
  belongs_to :maquina
  belongs_to :produto

  # has_attached_file :arquivo
  # do_not_validate_attachment_file_type :arquivo

  validates :pedido_id, presence: true
  validates :pedido_item_id, presence: true
  validates :peso, presence: true
end
