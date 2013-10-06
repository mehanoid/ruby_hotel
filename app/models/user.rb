class User < ActiveRecord::Base
  extend Enumerize

  ROLES = %i[receptionist reservation_manager admin].freeze

  enumerize :role, in: ROLES, predicates: true

  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable

end
