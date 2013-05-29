class AddInfosToUser < ActiveRecord::Migration
  def change
    add_column :users, :de_onde, :string
    add_column :users, :nome_convite, :string
    add_column :users, :convidados, :string
    add_column :users, :numero_telefone, :string
  end
end
