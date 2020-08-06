class SuitcasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    admin_or_not?
  end

  def destroy?
    admin_or_not?
  end

  private

  def admin_or_not?
    record.user == user || user.administrator
  end
end
