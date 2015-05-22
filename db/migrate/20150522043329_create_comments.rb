class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email, null: false
      t.text :comment, null: false
      t.references :post, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
