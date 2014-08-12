class CreateBancoIdeiaTemas < ActiveRecord::Migration
  def change
    create_table :banco_ideia_temas do |t|
      t.integer :banco_ideium_id
      t.integer :tema_id

      t.timestamps
    end
  end
end
