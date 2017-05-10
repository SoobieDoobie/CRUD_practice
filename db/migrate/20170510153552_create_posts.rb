class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :title
      t.text :content
      t.string :username

      t.timestamps null: false
    end
  end
end
