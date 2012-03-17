class CreateCategoria < ActiveRecord::Migration
  def change
  	create_table :categoria do |t|
      t.string :nome
      t.string :descricao
      t.references :post

      t.timestamps
    end
    
  end
end
