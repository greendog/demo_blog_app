# This migration comes from core (originally 20151221201456)
class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
      t.integer :category_id
      t.integer :post_id
    end

    add_index :categories_posts, [:category_id, :post_id], :name => 'index_categories_posts_on_bc_and_bp'
  end
end
