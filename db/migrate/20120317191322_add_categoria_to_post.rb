class AddCategoriaToPost < ActiveRecord::Migration
  def change
  		remove_index :categoria, :column => :post_id
  		add_column :posts, :categoria_id, :integer
  		add_index :posts, :categoria_id
  end
end
