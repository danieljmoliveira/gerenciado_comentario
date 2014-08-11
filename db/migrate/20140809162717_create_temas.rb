class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
