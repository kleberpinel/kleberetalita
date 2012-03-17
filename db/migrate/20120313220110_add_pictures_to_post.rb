class AddPicturesToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :picture1, :string
  	add_column :posts, :picture2, :string
  	add_column :posts, :picture3, :string
  end
end