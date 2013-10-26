class Client < ActiveRecord::Base
  has_one :contact_information
  has_one :passport
  has_many :reservations
  has_many :accommodations

  accepts_nested_attributes_for :contact_information

  validates :first_name, :last_name, :middle_name, :contact_information, presence: true

  before_validation do |client|
    client.build_contact_information unless client.contact_information
  end
end
