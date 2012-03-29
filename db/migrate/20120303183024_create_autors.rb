class CreateAutors < ActiveRecord::Migration
  def change
    create_table :autors do |t|
      t.string :nome
      t.string :titulo_blog
      t.string :sobre
      t.string :nome_menu

      t.timestamps
    end
  end
end
