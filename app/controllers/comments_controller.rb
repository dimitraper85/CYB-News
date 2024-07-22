class CommentsController < ApplicationController
  def create
    comment = Comment.new(content: params["comment"][:content])
    comment.user_id = current_user.id
    comment.article_id = params[:article_id]
    article = Article.find(params[:article_id])
    if comment.save
      redirect_to article_path(article)
    else
      render "articles/show", status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:article_id])
    puts comment
    comment.destroy
    redirect_to article_path(params[:id])
  end
end
