# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can [:read, :create, :destroy], Category, user: user
    can [:read, :create, :destroy], UserTransaction, user: user
  end
end
