class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.favorites
    end
  end
end
