class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])

    @posts = @q.result(distinct: true).includes(:author).order(created_at: :asc)

    @pagy, @posts = pagy(@posts)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))
    @post.save
    redirect_to action: :index
  end

  def new
    @post = Post.new
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(post_params)
    redirect_to users_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :search)
  end
end
