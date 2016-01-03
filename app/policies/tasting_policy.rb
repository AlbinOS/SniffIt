class TastingPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def update?
    same_user_id? or user.has_role? :admin
  end

  def destroy?
    same_user_id? or user.has_role? :admin
  end
end
