FactoryGirl.define do
  factory :passport do
    document_type 'Паспорт РФ'
    number '4520 932795'
    date_of_issue '2010-12-12'
    issuing_authority 'Кировским РОВД г. Перми.'
  end
end
