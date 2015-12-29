class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    cannot :manage, :all
    cannot :read, :all

    if user.admin?
      can :manage, :all
    end

    if user.user?
      can :create, Comment
    end

  end
end
