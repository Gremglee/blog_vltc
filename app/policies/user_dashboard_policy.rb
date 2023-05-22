class UserDashboardPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def index?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    user.admin?
  end
end
