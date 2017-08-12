module RelatoriosHelper
  def filtro(param, label, collection=nil, label_method=nil)
    if collection
      filtro_opcoes(param, label, collection, label_method)
    else
      filtro_texto(param, label)
    end
  end

  def filtro_texto(param, label)
    %{
    <div class="col-md-3">
      <div class="form-group">
        #{ label_tag  param, label }
        #{ text_field_tag param, params[param], class: 'form-control' }
      </div>
    </div>
    }.html_safe
  end

  def filtro_opcoes(param, label, collection, label_method=nil)
    if label_method
      options = options_from_collection_for_select(collection, :id, label_method, selected: params[param])
    else
      options = options_for_select(collection, selected: params[param])
    end
    %{
    <div class="col-md-3">
      <div class="form-group">
        #{ label_tag  param, label }
        #{ select_tag param, options, include_blank: true, class: 'form-control' }
      </div>
    </div>
    }.html_safe
  end
end
