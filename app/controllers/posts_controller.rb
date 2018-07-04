class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params_post)

    if @post.save
      redirect_to posts_path
    else 
      redirect_to posts_path
    end

  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(params_post)
      redirect_to @post
    else
      render 'Edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to posts_url
    end
  end
  
  private 
  def params_post 
    params.require(:post).permit(:body, :title)
  end 
end
