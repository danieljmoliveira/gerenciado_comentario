class CreateCidadeEstados < ActiveRecord::Migration
  def change
    create_table :cidade_estados do |t|
      t.string :estado
      t.string :cidade

      t.timestamps
    end
  end
end
