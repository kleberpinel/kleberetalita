class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :nome
      t.text :descricao
      
      t.timestamps
    end
  end
end
