class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :author
      t.integer :post
      t.integer :parent_id

      t.timestamps
    end
  end
end
