module RelatoriosHelper
  def filtro(param, label, collection, label_method=nil)
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
