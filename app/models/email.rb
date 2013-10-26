class Email < ActiveRecord::Base
  belongs_to :contact_information

  validates :address, presence: true
end
