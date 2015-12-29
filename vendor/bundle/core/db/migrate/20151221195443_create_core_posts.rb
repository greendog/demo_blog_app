class CreateCorePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.boolean :draft
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :id
    add_index :posts, :slug, unique: true
  end
end
