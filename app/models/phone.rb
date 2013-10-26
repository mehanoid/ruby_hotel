class Phone < ActiveRecord::Base
  belongs_to :contact_information

  validates :number, presence: true
end
