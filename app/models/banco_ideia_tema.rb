class BancoIdeiaTema < ActiveRecord::Base
	belongs_to :banco_ideium, :class_name => "BancoIdeium", :foreign_key => "banco_ideium_id"


	def self.pesquisa_temas(id)
		find_by_sql(["select t.id,t.descricao,b.titulo,b.texto_ideia,b.nome,b.id as codigo FROM banco_ideia_temas i
			INNER JOIN temas t ON 
			t.id=i.tema_id
			INNER JOIN banco_ideia b ON
			b.id=i.banco_ideium_id WHERE t.id=?",id])
	end
end
