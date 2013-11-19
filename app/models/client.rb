class Client < ActiveRecord::Base
  has_one :contact_information
  has_one :passport
  has_many :reservations
  has_many :accommodations

  accepts_nested_attributes_for :passport, :contact_information

  validates :first_name, :last_name, :middle_name, :contact_information, presence: true
  validates :passport, :birthday, presence: true, if: -> c do
    c.accommodations.any? || c.all_data_should_be_present
  end

  attr_accessor :all_data_should_be_present

  before_validation do |client|
    client.build_contact_information unless client.contact_information
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
