Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "bookmarks", to: "pages#saved_bookmarks"

  resources :articles, only: [:index, :show] do
    member do
      post 'toggle_favorite', to: "articles#toggle_favorite"
    end
    resources :comments, only: [:create, :destroy]
  end

  resources :user_articles, only: [:index, :new, :create]
  resources :favoritors, only: [:index] # think if you need to create a standalone route
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
