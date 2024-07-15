class CreateUserArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_articles do |t|
      t.text :content
      t.string :title
      t.string :article_url
      t.boolean :fake_news_validation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
