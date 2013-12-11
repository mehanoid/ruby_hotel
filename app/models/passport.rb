class Passport < ActiveRecord::Base
  belongs_to :client

  validates :document_type, :number, :date_of_issue, :issuing_authority, presence: true

  DOCUMENT_TYPES = ['Паспорт РФ', 'Заграничный паспорт', 'Иностранный документ', 'Водительское удостоверение']

  validates :document_type, inclusion: { in: DOCUMENT_TYPES }
end
