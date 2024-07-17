class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.all
    @categories = []
    @articles.each { |article| @categories.push(article.category) }
    if params[:query].present?
      @articles = @articles.where(category: params[:query]) unless params[:query] == "all"
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "articles/list", locals: {articles: @articles}, formats: [:html] }
    end
  end
end
