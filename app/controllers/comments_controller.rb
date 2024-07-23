class CommentsController < ApplicationController
  def create
    comment = Comment.new(safe_params)
    comment.user_id = current_user.id
    comment.article_id = params["article_id"]
    comment.save!
    article = Article.find(params["article_id"])
    @comments = Comment.where(article_id: params["article_id"])
    redirect_to article_path(article.id)
    # respond_to do |format|
    #   format.html { redirect_to article_path(article) }
    #   format.text { render partial: "articles/comments", locals: { comments: @comments }, formats: [:html] }
    # end
  end

  def destroy
    comment = Comment.find(params[:article_id])
    puts comment
    comment.destroy
    redirect_to article_path(params[:id])
  end

  private

  def safe_params
    params.require(:comment).permit(:content)
  end
end
