class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :article_url
      t.string :title
      t.string :description
      t.text :content
      t.string :image_url
      t.date :pub_date
      t.string :source_name
      t.boolean :fake_news_validation
      t.string :category

      t.timestamps
    end
  end
end
