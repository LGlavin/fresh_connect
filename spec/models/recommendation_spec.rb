require 'spec_helper'

describe Recommendation do
  it {should belong_to(:user) }
  it { should belong_to(:market) }
  it { should validate_presence_of(:user) }
 
end
