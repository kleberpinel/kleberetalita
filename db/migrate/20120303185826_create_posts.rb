class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :texto
    	t.string :titulo
    	t.text :descricao
    	t.date :data
        t.string :picture1
        t.string :picture2
        t.string :picture3

        t.references :categoria
        t.references :autor

    	t.timestamps
    end
  end
end
