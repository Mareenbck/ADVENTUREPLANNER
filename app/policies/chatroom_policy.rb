class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.joins(bookings: [:user]).where(bookings: {user: user})
    end
  end

  def show?
    true
  end
end
