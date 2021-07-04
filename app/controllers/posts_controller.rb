class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @comments = post.comments
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
  end

  def edit
    post
  end

  def update
    post.update(post_params)
  end

  def destroy
    post.destroy
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
