class CreateCoreComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.string :email
      t.text :body
      t.string :state

      t.timestamps null: false
    end

    add_index :comments, :id
    add_index :comments, :post_id
  end
end
