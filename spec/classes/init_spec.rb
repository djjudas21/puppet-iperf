require 'spec_helper'
describe 'iperf' do

  context 'with defaults for all parameters' do
    it { should contain_class('iperf') }
  end
end
