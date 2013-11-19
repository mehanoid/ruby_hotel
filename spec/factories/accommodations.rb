# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accommodation do
    placements { [build(:placement)] }
    association :client, factory: :client_for_accommodation
  end
end
