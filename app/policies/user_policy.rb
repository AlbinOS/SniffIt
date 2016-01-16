class UserPolicy < ApplicationPolicy

  def index?
    false or user.has_role? :admin
  end

  def show?
    super
    record.id == user.id or user.has_role? :admin
  end

  def create?
    false or user.has_role? :admin
  end

  def update?
    record.id == user.id or user.has_role? :admin
  end

  def destroy?
    record.id == user.id or user.has_role? :admin
  end
end
