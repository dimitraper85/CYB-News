namespace :user do
  desc "Triggering the job that fetches the articles from the News API"
  task trigger_seed: :environment do
    SeedJob.perform_later
  end
end
