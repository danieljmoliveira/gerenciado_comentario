class BancoIdeium < ActiveRecord::Base

	validates :nome, :presence => { :message => " cannot be blank" }
	#attr_accessor :nome, :email, :estado, :telefone, :titulo, :texto_ideia

	has_many :ideia_votos
	has_many :banco_ideia_temas

	validates :email, presence: true

	


	def self.ideias_por_temas(tema)
		sql  = ["select * from banco_ideia where ? = any( string_to_array(lista_tipo, ',')::int[] )", tema]
		dados = BancoIdeium.find_by_sql(sql)
		return dados
	end
end
