class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable

  enumerize :role, in: %w[receptionist reservation_manager admin], predicates: true
end
