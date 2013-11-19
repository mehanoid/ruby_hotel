class Passport < ActiveRecord::Base
  belongs_to :client

  validates :number, :date_of_issue, :issuing_authority, presence: true
end
