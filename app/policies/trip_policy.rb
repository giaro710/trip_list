class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.administrator?
        scope.all
      else
        scope.where(user: user).geocoded
      end
    end
  end

  def show?
    admin_or_not?
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
