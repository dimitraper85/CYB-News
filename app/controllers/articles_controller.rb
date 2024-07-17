class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.all
    @categories = []
    @articles.each { |article| @categories.push(article.category) }
    if params[:query].present?
      puts "this is the query #{params[:query]}"
      @articles = @articles.where(category: params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "articles/list", locals: {articles: @articles}, formats: [:html] }
    end
  end
end
