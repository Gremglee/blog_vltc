class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:author).order(created_at: :desc)
    @pagy, @posts = pagy(@posts)
  end

  def show
    @comment = Comment.new(post: @post, user: current_user)

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

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    authorize @post

    @post.destroy!
    redirect_to posts_path
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :search)
  end
end
