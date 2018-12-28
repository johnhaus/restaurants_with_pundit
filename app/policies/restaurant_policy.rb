class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # uncomment the code below if decision is made to prevent
  # users from creating new restaurants

  # def new?
  #   false
  # end

  def create?
    return true
  end

  def edit?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def user_is_owner?
    record.user == user
  end
end
