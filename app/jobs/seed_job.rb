class SeedJob < ApplicationJob
  queue_as :default

  def perform
    response = RestClient.post("https://eventregistry.org/api/v1/article/getArticles", body, {"Content-Type" => "application/json"})
    parsed_response = JSON.parse(response.body)
    parsed_response["articles"]["results"].each do |parsed_article|
      article = Article.new
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
      response = PredictNewsService.predict_news(article.content)

      article.fake_news_validation = response[:fake]
      article.probability = response[:probability]
      article.save!
    end
  end
end
