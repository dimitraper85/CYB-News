namespace :user do
  desc "Triggering the job that fetches the articles from the News API"
  task trigger_seed: :environment do
    SeedJob.set(wait: 12.hours).perform_later
  end
end
