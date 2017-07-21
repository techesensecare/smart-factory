class Anexo < ApplicationRecord
  include Codigo

  belongs_to :anexavel, polymorphic: true

  has_attached_file :arquivo
  do_not_validate_attachment_file_type :arquivo

  validates :arquivo_file_name, presence: true
end
