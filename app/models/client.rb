class Client < ActiveRecord::Base
  has_one :contact_information
  has_one :passport
end
