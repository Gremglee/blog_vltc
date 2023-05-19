class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:author).order(created_at: :asc)
    @pagy, @posts = pagy(@posts)
  end

  def show
    @post = Post.find(params[:id])

    authorize @post
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))
    authorize @post

    @post.save
    redirect_to action: :index
  end

  def new
    @post = Post.new

    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    @post.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :search)
  end
end
