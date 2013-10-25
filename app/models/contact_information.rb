class ContactInformation < ActiveRecord::Base
  belongs_to :client
  has_many :phones
  has_many :emails
end
