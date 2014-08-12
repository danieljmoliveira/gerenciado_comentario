class CreateIdeiaVotos < ActiveRecord::Migration
  def change
    create_table :ideia_votos do |t|
      t.string :voto
      t.integer :banco_ideium_id
      t.timestamps
    end
  end
end
