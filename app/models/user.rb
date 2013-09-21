class User < ActiveRecord::Base
  devise :database_authenticatable, :timeoutable,
         :recoverable, :trackable, :validatable
end
