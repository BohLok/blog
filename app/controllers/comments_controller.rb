class CommentsController < ApplicationController
before_action :set_post  
  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.save
    redirect_to @post
  end

  def show
  end

  def delete
  end

  def destroy
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
