class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts=Post.all
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created! :-)'
    else
      render new
    end
  end

  def edit
  end

  def update
 
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated! :-)'
    else
      render edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
