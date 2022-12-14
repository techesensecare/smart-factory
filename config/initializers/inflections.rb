# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.irregular 'fornecedor', 'fornecedores'
  inflect.irregular 'terminal', 'terminais'
  inflect.irregular 'maquina', 'maquinas'
  inflect.irregular 'ferramenta', 'ferramentas'
  inflect.irregular 'operacao', 'operacoes'
  inflect.irregular 'pedido_operacao', 'pedido_operacoes'
  inflect.irregular 'materias_prima', 'materias_primas'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
