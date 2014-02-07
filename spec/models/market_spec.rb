require 'spec_helper'

describe Market do
 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:user) }


end
