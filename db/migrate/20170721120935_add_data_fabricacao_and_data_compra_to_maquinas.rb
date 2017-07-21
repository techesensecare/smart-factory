class AddDataFabricacaoAndDataCompraToMaquinas < ActiveRecord::Migration[5.0]
  def change
    add_column :maquinas, :data_fabricacao, :date
    add_column :maquinas, :data_compra, :date
  end
end
