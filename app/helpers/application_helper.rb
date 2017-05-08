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

  def select2_collection_tags(collection, metodo, valor_atual)
    values = Produto.all.map { |a| a.send(metodo) }
    result = values + [valor_atual]
    result = result - ['']
  end
end
