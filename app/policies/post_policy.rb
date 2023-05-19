class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    user.admin? || user.editor? || post.user == user
  end

  def delete?
    user.admin? || post.user == user
  end

  def create?
    !user.readonly?
  end

  def read?
    true
  end
end
