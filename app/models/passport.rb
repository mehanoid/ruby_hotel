class Passport < ActiveRecord::Base
  belongs_to :client
end
