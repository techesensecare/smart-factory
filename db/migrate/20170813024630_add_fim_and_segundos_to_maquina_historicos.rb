class AddFimAndSegundosToMaquinaHistoricos < ActiveRecord::Migration[5.1]
  def change
    add_column :maquina_historicos, :fim, :datetime
    add_column :maquina_historicos, :segundos, :integer

    MaquinaHistorico.all.each do |h|
      posterior = h.maquina.historicos.where('created_at > ?', h.created_at).first
      if posterior
        h.fim      = posterior.created_at
        h.segundos = h.fim - h.created_at
        h.save
      end
    end
  end
end
