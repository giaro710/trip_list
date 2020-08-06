class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  private

  def admin_or_not?
    record.user == user || user.administrator
  end
end
