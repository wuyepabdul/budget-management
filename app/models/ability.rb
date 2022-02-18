class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create destroy], Category, user: user
    can %i[read create destroy], UserTransaction, user: user
  end
end
