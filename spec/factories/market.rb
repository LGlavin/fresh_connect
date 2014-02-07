# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market do
    name "Easton Market"
    address "Lakewood Ave"
    city "Easton"
    state "MA"
    postal_code 02375
    latitude 1.5
    longitude 1.5
    datetime 'monday'
  end
end
