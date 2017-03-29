class Maquina < ApplicationRecord
  has_many :etapas
  has_and_belongs_to_many :celulas
  validates :descricao, presence: true

  has_attached_file :foto
  do_not_validate_attachment_file_type :foto
end
