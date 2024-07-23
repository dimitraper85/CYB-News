class SeedJob < ApplicationJob
  require "rest-client"
  require "json"
  queue_as :default

  def perform
    Article.where('created_at < ?', 48.hours.ago).destroy_all
    body = {
      action: "getArticles",
      ignoreSourceGroupUri: "paywall/paywalled_sources",
      isDuplicateFilter: "skipDuplicates",
      articlesPage: 1,
      articlesCount: 100,
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
      apiKey: "#{ENV["NEWS_API_KEY"]}"
    }.to_json

    response = RestClient.post("https://eventregistry.org/api/v1/article/getArticles", body, {"Content-Type" => "application/json"})
    parsed_response = JSON.parse(response.body)
    parsed_response["articles"]["results"].each do |parsed_article|
      article = Article.find_or_initialize_by(article_url: parsed_article["url"])
      article.pub_date = parsed_article["dateTimePub"]
      article.article_url = parsed_article["url"]
      article.title = parsed_article["title"]
      article.content = parsed_article["body"]
      if parsed_article["image"] == nil
        article.image_url = "https://tse4.mm.bing.net/th?id=OIG1.v6ZUiKDv.rJpKz47JY7f&pid=ImgGn"
      else
        article.image_url = parsed_article["image"]
      end
      article.category = parsed_article["categories"].last["label"]
      article.source_name = parsed_article["source"]["title"]
      sleep(1)
      response = PredictNewsService.predict_news(article.content)

      article.fake_news_validation = response[:fake]
      article.probability = response[:probability]
      article.save!
    end

    #Comment.create!(user_id: u1.id, article_id: Article.first.id, content: "I am really surprised that this is not a fake news ! Good to know.")
    #Comment.create!(user_id: u1.id, article_id: Article.second.id, content: "It is a disaster how this has been handled. I hope solution will be found")
    #Comment.create!(user_id: u2.id, article_id: Article.third.id, content: "All these shootings ! I couldn't believe first. I straight went here to fact check !")

    #Bookmark.create!(user_id: u3.id, article_id: Article.first.id)
    #Bookmark.create!(user_id: u3.id, article_id: Article.second.id)
    #Bookmark.create!(user_id: u1.id, article_id: Article.third.id)
  end
end
