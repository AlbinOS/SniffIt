class WinePolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def update?
    same_user_id?
  end

  def destroy?
    same_user_id?
  end
end
