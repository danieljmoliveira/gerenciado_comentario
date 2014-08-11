class BancoIdeium < ActiveRecord::Base

	def self.ideias_por_temas(tema)
		sql  = ["select * from banco_ideia where ? = any( string_to_array(lista_tipo, ',')::int[] )", tema]
		dados = BancoIdeium.find_by_sql(sql)
		return dados
	end
end
