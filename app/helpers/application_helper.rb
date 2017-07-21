module ApplicationHelper
  def app_name
    "Smart Factory"
  end

  def background
    '#f9f9f9'
  end

  def logo
    'smart-factory.jpg'
  end

  def logo_width
    '100%'
  end

  def logo_header
    nil
  end

  def logo_header_width
    '252px'
  end

  def background_header
    'inherit'
  end

  def link_color
    '#428bca' 
  end

  def link_ver_arquivo(objeto, metodo) 
    arquivo = objeto.send(metodo)
    if not arquivo.blank?
      link_to "Ver arquivo", arquivo.url
    end
  end

  def select2_collection_tags(collection, metodo, valor_atual, campo_com_valor=nil)
    campo_com_valor ||= metodo
    values = collection.map { |a| [a.send(metodo), a.send(campo_com_valor)] }
    result = values + [[valor_atual, valor_atual ]]
    result = result - ['']
  end

  def codigo_field(form)
    codigo_automatico = form.input(
      :codigo_automatico, 
      label: 'Código', 
      as: :radio_buttons,
      required: true,
      collection: [['Gerar código automático', true], ['Inserir código manual', false]]
    ) 
    codigo = form.input(:codigo, label: false, input_html: { readonly: form.object.codigo_automatico})
    codigo_automatico + codigo
  end
end
