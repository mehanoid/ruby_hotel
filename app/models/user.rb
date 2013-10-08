class User < ActiveRecord::Base
  extend Enumerize

  EMPLOYEES_ROLES = %w[receptionist reservation_manager admin].freeze.each(&:freeze)
  ROLES = EMPLOYEES_ROLES

  enumerize :role, in: ROLES, predicates: true

  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable

  def employee?
    role.in? EMPLOYEES_ROLES
  end

end
