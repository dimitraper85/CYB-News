require 'time'

class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @count = 100
    @articles = Article.all
    @categories = []
    @articles.each { |article| @categories.push(article.category) }
    if params[:query].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:query]}%")
    end
    if params[:category].present?
      @articles = @articles.where(category: params[:category]) unless params[:category] == "all"
    end
    @articles = @articles.sort_by { |article| article[:pub_date] }
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "articles/list", locals: { articles: @articles }, formats: [:html] }
    end
  end

  def show
    if params[:id].nil?
      @article = Article.find(params["article_id"])
    else
      @article = Article.find(params[:id])
    end
    # Hardcoded for display purposes - placeholder till data team provides 0 to 1 value
    @percentage = 50
    @articles = Article.where("id > ?", @article.id).order(id: :asc).limit(3)
    @comments = Comment.where(article_id: @article.id, user_id: current_user.id)
    @new_comment = Comment.new
  end

  def toggle_favorite
    @article = Article.find_by(id: params[:id])
    current_user.favorited?(@article) ? current_user.unfavorite(@article) : current_user.favorite(@article)
    @favorited = current_user.favorited?(@article)
    render json: { favorited: @favorited }
  end
end
