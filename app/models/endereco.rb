# == Schema Information
#
# Table name: enderecos
#
#  id               :integer          not null, primary key
#  logradouro       :string(255)
#  numero           :string(255)
#  bairro           :string(255)
#  complemento      :string(255)
#  cidade           :string(255)
#  estado           :string(255)
#  tipo             :string(255)
#  enderecable_id   :integer
#  enderecable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Endereco < ActiveRecord::Base
	extend Enumerize

	belongs_to :enderecable, polymorphic: true

	enumerize :estado, in: {:acre => 'AC', :alagoas => 'AL', :amapa => 'AP', :amazonas => 'AM',
							:bahia => 'BA', :ceara => 'CE', :distrito_federal => 'DF', :espirito_santo => 'ES',
							:goias => 'GO', :maranhao => 'MA', :mato_grosso => 'MT', :mato_grosso_do_sul => 'MS',
							:minas_gerais => 'MG', :para => 'PA', :paraiba => 'PB', :parana => 'PR', 
							:pernambuco => 'PE', :piaui => 'PI', :rio_de_janeiro => 'RJ', :rio_grande_do_norte => 'RN',
							:rio_grande_do_sul => 'RS', :rondonia => 'RO', :roraima => 'RR', :santa_catarina => 'SC',
							:sao_paulo => 'SP', :sergipe => 'SE', :tocantins => 'TO'}, 
	            predicates: true,
	            scope: true

	validates :logradouro, 
            :cidade, 
            :estado,
            presence: true

  def descricao_completa
    [logradouro, numero, complemento, cidade, estado.try(:value), cep].reject(&:blank?).join(', ')
  end
end
