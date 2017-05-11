class Parada < ApplicationRecord
  default_scope { order('descricao ASC') }
end
