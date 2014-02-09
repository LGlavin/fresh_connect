require 'spec_helper'

describe Market do
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
  it { should have_many(:recommendations) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:address) }
  
  it { should have_valid(:state).when('MA', 'VT') }
  it { should_not have_valid(:state).when(nil, 'coffee', " ") }

  it { should have_valid(:postal_code).when('02375', '02356', '90210') }
  it { should_not have_valid(:postal_code).when(nil, '123456', '1', '-1') }
end
