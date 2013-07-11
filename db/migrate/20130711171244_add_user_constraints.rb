class AddUserConstraints < ActiveRecord::Migration
  def up
    execute 'alter table users add constraint unique_name unique(nome_convite)'
  end

  def down
    execute 'alter table users drop constraint unique_name'
  end

end
