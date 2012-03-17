class DropTables < ActiveRecord::Migration
  def up
  	drop_table :categoria
  	#drop_table :comments
  	#drop_table :posts
  end

  def down
  end
end
