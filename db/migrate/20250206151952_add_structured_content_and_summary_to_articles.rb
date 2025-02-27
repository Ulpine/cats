class AddStructuredContentAndSummaryToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :structured_content, :text
    add_column :articles, :summary, :string
  end
end
