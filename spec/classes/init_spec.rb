require 'spec_helper'
describe 'zabbixa' do

  context 'with defaults for all parameters' do
    it { should contain_class('zabbixa') }
  end
end
