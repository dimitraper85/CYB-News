class VerifyValidityApiJob < ApplicationJob
  queue_as :default

  def perform(article)
    # need to connect API call
    puts "Fetching validity of #{article.title}"
    response = PredictNewsService.predict_news(article.content)
    result = response[:fake]
    puts "update Article to #{result}"
    article.update(fake_news_validation: result)
    puts "Article checked"
  end
end
