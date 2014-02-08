# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review, :class => 'Reviews' do
    user_id 1
    market_id 1
    body "Great!"
  end
end
