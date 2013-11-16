require 'spec_helper'

describe Market do
  
  it { should have_valid(:description).when('best haverst') }

  it { should have_valid(:address).when('44 lakewood ave') }
  #it { should_not have_valid(:address).when(nil, '') }
  
  it { should have_valid(:longitude).when('-70.59368') }
  it { should_not have_valid(:longitude).when(nil,'') }

  it { should have_valid(:latitude).when('41.45617') }
  it { should_not have_valid(:latitude).when(nil,'') }
end