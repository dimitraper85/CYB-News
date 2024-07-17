# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "rest-client"
require "json"

User.destroy_all
Article.destroy_all
Comment.destroy_all
Bookmark.destroy_all

# creates user seeds
u1 = User.create!(email: "dimitra@email.com", password: "123456", username: "Dimitra")
u2 = User.create!(email: "heena@email.com", password: "123456", username: "Heena")
u3 = User.create!(email: "judith@email.com", password: "123456", username: "Judith")
u4 = User.create!(email: "max@email.com", password: "123456", username: "Max")
u5 = User.create!(email: "test@email.com", password: "123456", username: "ProTester")

# creates article seeds
body = {
  action: "getArticles",
  ignoreSourceGroupUri: "paywall/paywalled_sources",
  isDuplicateFilter: "skipDuplicates",
  articlesPage: 1,
  articlesCount: 30,
  articlesSortBy: "date",
  articlesSortByAsc: false,
  dataType: [
    "news"
  ],
  includeArticleBasicInfo: true,
  includeArticleCategories: true,
  categoryUri: [
    "news/Politics", "news/Environment", "news/Science"
  ],
  lang: [
    "eng"],
  forceMaxDataTimeWindow: 7,
  resultType: "articles",
  apiKey: "#{NEWS_API_KEY}"
  }.to_json

  response = RestClient.post("https://eventregistry.org/api/v1/article/getArticles", body, {"Content-Type" => "application/json"})
  parsed_response = JSON.parse(response.body)
  parsed_response["articles"]["results"].each do |parsed_article|
  article = Article.new
  article.pub_date = parsed_article["dateTimePub"]
  article.article_url = parsed_article["url"]
  article.title = parsed_article["title"]
  article.content = parsed_article["body"]
  article.image_url = parsed_article["image"]
  article.category = parsed_article["categories"].last["label"]
  article.source_name = parsed_article["source"]["title"]
  article.fake_news_validation = false
  article.save!
end

Comment.create!(user_id: u1.id, article_id: 10, content: "I am really surprised that this is not a fake news ! Good to know.")
Comment.create!(user_id: u1.id, article_id: 11, content: "It is a disaster how this has been handled. I hope solution will be found")
Comment.create!(user_id: u2.id, article_id: 10, content: "All these shootings ! I couldn't believe first. I straight went here to fact check !")

Bookmark.create!(user_id: u3.id, article_id: 12)
Bookmark.create!(user_id: u3.id, article_id: 11)
Bookmark.create!(user_id: u1.id, article_id: 10)

puts "seeding successful"
