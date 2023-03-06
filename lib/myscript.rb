class MyScript

  # require "#{Rails.root}/lib/myscript.rb"
  # MyScript.run

  #Movimento.destroy_all
  #ItemPedido.destroy_all
  #Operacao.destroy_all
  #Produto.destroy_all


  def self.format_weight(weight)
    if weight == "KG"
      "kg"
    else
      weight
    end
  end

  def self.run
    
    if ProdutosMrTaste.first.materia_prima = 'materia_prima'
      ProdutosMrTaste.first.destroy
    end


    ProdutosMrTaste.all.each do |pm|
      b = Produto.new(
        codigo: "#{pm.codigo_ordem_producao}, ID: #{pm.id}",
        descricao: "#{pm.materia_prima}, OP: #{pm.codigo_ordem_producao}, ID: #{pm.id}",
        unidade_medida: format_weight(pm.unidade_medida),
        tipo: nil,
        codigo_automatico: false,
        composto: true,
        mr_taste_mp: pm.id
      )
      b.save
    end
  end
end



 # require "#{Rails.root}/lib/myscript.rb"
 # MyScript.run