class CreateBancoIdeia < ActiveRecord::Migration
  def change
    create_table :banco_ideia do |t|
      t.string :nome
      t.string :email
      t.string :estado
      t.string :cidade
      t.string :telefone
      t.string :lista_tipo
      t.string :titulo
      t.text :texto_ideia

      t.timestamps
    end
  end
end
