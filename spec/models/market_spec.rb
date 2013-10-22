require 'spec_helper'

describe Market do
  
  it { should have_valid(:description).when('best haverst') }

  it { should have_valid(:address).when('44 lakewood ave') }
  it { should_not have_valid(:address).when(nil, '') }

end