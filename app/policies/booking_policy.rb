class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

    def create?
      true
    end

    def destroy?
      record.user == user
    end
  end
end
