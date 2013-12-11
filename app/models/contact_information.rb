class ContactInformation < ActiveRecord::Base
  belongs_to :client
  has_many :phones, dependent: :destroy
  has_many :emails, dependent: :destroy

  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :emails, reject_if: :all_blank

  validates :phones, presence: true

  before_validation do |contact|
    contact.phones.build unless contact.phones.any?
  end
end
