# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accommodation do
    placements { [build(:placement)] }
    client
  end
end
