class UserArticlesController < ApplicationController
  def index
    @user_articles = UserArticle.all
  end

  def new
    @user_article = UserArticle.new
  end

  def create
    user_article = UserArticle.new(safe_params)
    user_article.user_id = current_user.id
    user_article.fake_news_validation = false
    # add API call to check
    user_article.save!
    if user_article.save
      flash[:alert] = "Your article gets analysed !"
      redirect_to user_articles_path
    else
      render :new
    end
  end

  private

  def safe_params
    params.require(:user_article).permit(:title, :content, :article_url)
  end
end
