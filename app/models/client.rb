class Client < ActiveRecord::Base
  has_one :contact_information
  has_one :passport
  has_many :reservations
end
