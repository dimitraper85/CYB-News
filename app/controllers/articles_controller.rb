class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :toggle_favorite]

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

  def show
    @article = Article.find(params[:id])
    # Hardcoded for display purposes - placeholder till data team provides 0 to 1 value
    @percentage = 50
    @articles = Article.where("id > ?", @article.id).order(id: :asc).limit(3)
  end

  def toggle_favorite
    @article = Article.find_by(id: params[:id])
    current_user.favorited?(@article) ? current_user.unfavorite(@article) : current_user.favorite(@article)
    @favorited = current_user.favorited?(@article)
    render json: { favorited: @favorited }
  end
end
