class Client < ActiveRecord::Base
  has_one :contact_information, dependent: :destroy
  has_one :passport, dependent: :destroy
  has_many :reservations, dependent: :nullify
  has_many :accommodations, dependent: :nullify

  accepts_nested_attributes_for :passport, :contact_information

  validates :first_name, :last_name, :middle_name, :contact_information, presence: true
  validates :passport, :birthday, presence: true, if: -> c do
    c.accommodations.any? || c.full_validation
  end

  attr_accessor :full_validation

  before_validation do |client|
    client.build_contact_information unless client.contact_information
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
