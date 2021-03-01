class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.chatrooms
      # scope.joins(bookings: [:user]).where(bookings: {user: user})
    end
  end

  def show?
    true
  end
end
