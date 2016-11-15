class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Please fix errors'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if @post.update post_params
      flash[:notice] = 'Post updated!'
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Please fix errors'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit([:title, :body])
  end

  def find_post
    @post = Post.find params[:id]
  end
end
