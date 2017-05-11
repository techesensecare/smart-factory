module AnexosHelper
  def load_anexos
    @anexos = @produto.anexos.order('id ASC')
    if params[:anexo_id]
      @anexo = @anexos.where(id: params[:anexo_id]).first
    else
      @anexo = @anexos.first
    end

    if @anexo
      antes, depois = @anexos.to_a.split(@anexo)
      @anterior = antes.last if antes
      @proximo  = depois.first if depois
    end
  end
end
