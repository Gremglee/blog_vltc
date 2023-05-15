class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def create
  end

  def new
  end

  def update
  end

  def destroy
  end
end
