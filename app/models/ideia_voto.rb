class IdeiaVoto < ActiveRecord::Base
	belongs_to :banco_ideium, :foreign_key => "banco_ideia_id"
end
