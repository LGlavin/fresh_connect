require 'spec_helper'

describe Market do
  
  it { should have_valid(:description).when('best haverst') }

  it { should have_valid(:address).when('44 lakewood ave') }
  
  it { should have_valid(:longitude).when('-70.59368') }

  it { should have_valid(:latitude).when('41.45617') }

end