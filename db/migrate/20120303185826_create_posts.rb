class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :texto
    	t.string :titulo
    	t.text :descricao
    	t.date :data
    	t.string :autor

    	t.timestamps
    end
  end
end
