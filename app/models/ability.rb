
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new :role => 'guest'

    if user.admin?
      can :manage, User
      can :manage, Tutorial
    elsif user.member?
      can :read, User
      can :update, User do |u|
        u == user
      end
      can :read, Tutorial
      can :create, Tutorial
      can :manage, Tutorial do |t|
        t.user == user
      end
    else
      can :read, User
      can :read, Tutorial
    end
  end

end
