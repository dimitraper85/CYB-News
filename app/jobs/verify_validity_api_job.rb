class VerifyValidityApiJob < ApplicationJob
  queue_as :default

  def perform(article)
    # need to connect API call
    result = true
    puts "Fetching validity of #{article.title}"
    article.update_attribute(:fake_news_validation, result)
    puts "Article checked"
  end
end
