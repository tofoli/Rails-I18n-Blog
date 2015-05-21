class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :content, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
