
require 'active_support/concern'

module Enderecos
  extend ActiveSupport::Concern

  included do
    has_many :enderecos, as: :enderecable, dependent: :destroy
    accepts_nested_attributes_for :enderecos, allow_destroy: true
  end
end
