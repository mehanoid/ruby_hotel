class User < ActiveRecord::Base
  extend Enumerize

  EMPLOYEES_ROLES = %w[receptionist reservation_manager admin].freeze.each(&:freeze)
  EMPLOYEES_ROLES_FOR_SELECT = Hash[*EMPLOYEES_ROLES.map { |role| [I18n.t("roles.#{role}"), role] }.flatten]

  validates :role, presence: true

  enumerize :role, in: EMPLOYEES_ROLES, predicates: true

  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable

  def employee?
    role.in? EMPLOYEES_ROLES
  end

  def human_role
    I18n.t "roles.#{role}"
  end

end
