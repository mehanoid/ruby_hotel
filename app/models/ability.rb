class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.reservation_manager?
      can :manage, Reservation
    elsif user.receptionist?
      can :manage, Reservation
    end
    if user.reservation_manager? || user.receptionist?
      can :read, :admin_home
    end
  end
end
