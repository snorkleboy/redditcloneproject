class PostsController < ApplicationController
  def post_params
    params.require(:post).permit(:title, :url, :content, :subs[])
  end

  def show; end

  def index; end

  def edit
    @post = current_user.posts.find(params[:id])
    if @post
      render :edit
    else
      "not your post"
    end

  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
  end

  def new; end

  def create
    @post = Post.new(post_params)
    if @post.save

    end
  end
end
