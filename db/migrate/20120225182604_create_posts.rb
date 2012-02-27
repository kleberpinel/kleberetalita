class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.text :description
      t.text :body
      t.boolean :published
      t.integer :author

      t.timestamps
    end
  end
end
