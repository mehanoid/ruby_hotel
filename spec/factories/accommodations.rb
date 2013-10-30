# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accommodation do
    placements { [build(:placement)] }
    client

    trait :with_nested_attributes do
      placements_attributes { [attributes_for(:placement)]}
      client_attributes { attributes_for(:client, :with_nested_attributes) }
    end
  end
end
