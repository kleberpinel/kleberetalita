class CreateConvidados < ActiveRecord::Migration
  def change
    create_table :convidados do |t|
      t.string :nome
      t.boolean :confimacao_presenca_cerimonia
      t.boolean :confimacao_presenca_festa

      t.references :user

      t.timestamps
    end
  end

  def down
    drop_table :convidados
  end
end
