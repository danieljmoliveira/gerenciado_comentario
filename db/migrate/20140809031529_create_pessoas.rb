class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :email
      t.string :estado
      t.string :cidade
      t.string :telefone

      t.timestamps
    end
  end
end
