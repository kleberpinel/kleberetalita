class AddInfosToUser < ActiveRecord::Migration
  def up
	  change_table :users do |t|
	    t.string :de_onde
	    t.string :nome_convite
	    t.string :convidados
	    t.string :nivel_certeza
	  	t.string :endereco
	  	t.string :origem
	  	t.string :numero_telefone
	  	t.boolean :disponivel_festa
	  	t.boolean :disponivel_cerimonia
	  end
	end

	#def down
	#	remove_column :users, :diponivel_cerimonia
	#	remove_column :users, :diponivel_festa
	#end
end
