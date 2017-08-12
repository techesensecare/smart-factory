module RelatoriosHelper
  def filtro(param, label, collection, label_method)
    %{
    <div class="col-md-3">
      <div class="form-group">
        #{ label_tag  param, label }
        #{ select_tag param, 
                      options_from_collection_for_select(collection, :id, label_method, selected: params[param]),
                      include_blank: true,
                      class: 'form-control' }
      </div>
    </div>
    }.html_safe
  end
end
