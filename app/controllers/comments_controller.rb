class CommentsController < ApplicationController
  def create
    @comment = post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def edit
    comment
  end

  def update
    comment.update(comment_params)
  end

  def destroy
    comment.destroy
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment
    @comment ||= post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
