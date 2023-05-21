class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    user.admin? || user.editor? || post.author == user
  end

  def update?
    user.admin? || user.editor? || post.author == user
  end

  def destroy?
    user.admin? || post.author == user
  end

  def create?
    !user.readonly?
  end

  def show?
    true
  end
end
