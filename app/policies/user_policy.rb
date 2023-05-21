class PostPolicy < ApplicationPolicy
  attr_reader :current_user, :object_user

  def initialize(current_user, object_user)
    @current_user = current_user
    @object_user = object_user
  end

  def edit?
    current_user.admin?
  end

  def update?
    current_user.admin? && current_user.id != object_user.id
  end

  def destroy?
    current_user.admin?
  end

  def show?
    current_user.admin?
  end
end
