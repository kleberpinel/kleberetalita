class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :nome
      t.string :picture
      t.text :descricao
      t.integer :width
      t.integer :height
      t.references :album

      t.timestamps
    end
  end
end
