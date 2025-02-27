class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :published
      t.datetime :published_at
      t.references :category, null: false, foreign_key: true
      t.text :meta_description

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
