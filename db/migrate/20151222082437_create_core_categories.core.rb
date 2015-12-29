# This migration comes from core (originally 20151221195438)
class CreateCoreCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end

    add_index :categories, :id
    add_index :categories, :slug, unique: true
  end
end
