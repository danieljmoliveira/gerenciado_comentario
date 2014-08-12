class BancoIdeiaTema < ActiveRecord::Base
	belongs_to :banco_ideium, :class_name => "BancoIdeium", :foreign_key => "banco_ideium_id"
end
