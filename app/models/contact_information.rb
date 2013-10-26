class ContactInformation < ActiveRecord::Base
  belongs_to :client
  has_many :phones
  has_many :emails

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :emails

  validates :phones, presence: true

  before_validation do |contact|
    contact.phones.build unless contact.phones.any?
  end
end
