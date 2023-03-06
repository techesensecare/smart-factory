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
    
    if destroy.materia_prima = 'materia_prima'
      ProdutosMrTaste.first.destroy
    end


    ProdutosMrTaste.all.each do |pm|

      existing_record = Produto.find_by(descricao: pm.materia_prima)

      if existing_record == nil
        existing_record = Produto.find_by(codigo: pm.codigo_ordem_producao)
      end

      if existing_record != nil
        existing_record.update(
          composto: true,
          mr_taste_mp: pm.id
        )
      else
        b = Produto.new(
          codigo: pm.codigo_ordem_producao,
          descricao: "#{pm.materia_prima}, OP: #{pm.codigo_ordem_producao}",
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
end



 # require "#{Rails.root}/lib/myscript.rb"
 # MyScript.run