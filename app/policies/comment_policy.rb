class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    false
  end

  def delete?
    user.admin? || comment.user == user
  end

  def create?
    !user.read_only?
  end

  def show?
    true
  end
end
