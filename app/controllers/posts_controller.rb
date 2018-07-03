class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  
  end

  def create
    @post = Post.new(params_post)

    if @post.save
      redirect_to posts_path
    else 
      redirect_to posts_path
    end

  end
  
  private 
  def params_post 
    params.require(:post).permit(:body, :title)
  end 
end
