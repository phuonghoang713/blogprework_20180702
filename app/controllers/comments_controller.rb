class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])#because it is a string
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post
    else 
      redirect_to @post
    end
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
