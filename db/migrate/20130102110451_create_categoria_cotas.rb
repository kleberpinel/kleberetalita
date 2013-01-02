class CreateCategoriaCotas < ActiveRecord::Migration
  def change
    create_table :categoria_cotas do |t|
      t.string :nome
      t.string :descricao
      t.string :imagem
      t.float :totalArrecadado

      t.timestamps
    end
  end
end
