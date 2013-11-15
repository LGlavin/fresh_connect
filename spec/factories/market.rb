# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :market do
    name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    postal_code "MyString"
    latitude 1.5
    longitude 1.5
    datetime 'monday'
  end
end
