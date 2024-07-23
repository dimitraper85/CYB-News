class UserArticlesController < ApplicationController
  def index
    @user_articles = UserArticle.where(user_id: current_user.id)
    if params[:query].present?
      @user_articles = @user_articles.where("title ILIKE ?",  "%#{params[:query]}%")
    end
    redirect_to new_user_article_path if @user_articles.empty?
  end

  def new
    @user_article = UserArticle.new
  end

  def create
    user_article = UserArticle.new(safe_params)
    user_article.user_id = current_user.id
    response = PredictNewsService.predict_news(user_article.content)
    user_article.fake_news_validation = response[:fake]
    user_article.probability = response[:probability]
    if user_article.save
      flash[:alert] = "Your article result is there !"
      # VerifyValidityApiJob.perform_later(user_article)
      redirect_to user_articles_path
    else
      render :new
    end
  end

  def destroy
    @user_article = UserArticle.find(params[:id])
    @user_article.destroy

    redirect_to user_articles_path, status: :see_other
  end

  private

  def safe_params
    params.require(:user_article).permit(:title, :content, :article_url)
  end
end
