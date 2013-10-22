require 'spec_helper'

describe Location do
  it {should have_valid(:address).when('49 Lakwood Rd.') }
  it {should_not have_valid(:address).when(nil, '') }
   

end
