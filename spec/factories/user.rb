FactoryGirl.define do
  factory :user do
    username 'Ruby01'
    first_name 'Ruby'
    last_name 'Smith'
    email 'Ruby@example.com'
    password 'MyString'
    password_confirmation 'MyString'
  end
end
