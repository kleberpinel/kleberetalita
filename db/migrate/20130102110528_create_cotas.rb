class CreateCotas < ActiveRecord::Migration
  def change
    create_table :cotas do |t|
      t.string :nome
      t.string :descricao
      t.float :valor
      t.string :imagem
      t.integer :cotas
      t.integer :totalVendido
      t.float :totalArrecadado
      t.references :categoria_cota

      t.timestamps
    end
  end
end
