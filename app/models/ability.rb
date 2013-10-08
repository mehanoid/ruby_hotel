class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.employee?
      can :read, :admin_home
    end
    if user.admin?
      can :manage, :all
    elsif user.reservation_manager?
      can :manage, Reservation
    elsif user.receptionist?
      can :manage, Reservation
    end
  end
end
