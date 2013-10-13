require 'spec_helper'

describe User do
  it { should have_many :market }
  it { should have_valid(:username).when("abcde12345-_vbfabcde12345-_vbf") }
  it { should_not have_valid(:username).when(nil, '', "abcde12345-_vbfabcde12345-_vbft") }
  
  it { should have_valid(:email).when('fern@gully.com') }
  it { should_not have_valid(:email).when(nil, '')}

  it 'has matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
