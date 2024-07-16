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
body = {
  action: "getArticles",
  ignoreSourceGroupUri: "paywall/paywalled_sources",
  isDuplicateFilter: "skipDuplicates",
  articlesPage: 1,
  articlesCount: 20,
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
  apiKey: "07b544e2-14fe-44e1-8ad0-f9b674ccd05e"
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
