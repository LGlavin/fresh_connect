require 'spec_helper'

describe Market do
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:postal_code)}
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:state) }
  it { should belong_to(:user) }
  it { should have_many(:reviews) }
  it { should have_many(:recommendations) }
end
