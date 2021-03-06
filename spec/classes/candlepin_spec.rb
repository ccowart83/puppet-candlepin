require 'spec_helper'

describe 'candlepin' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { should compile.with_all_deps }
      it { should contain_class('candlepin::repo') }
      it { should contain_class('candlepin::install') }
      it { should contain_class('candlepin::config') }
      it { should contain_class('candlepin::database::postgresql') }
      it { should contain_class('candlepin::service') }
      it { should contain_service('tomcat').with_ensure('running') }
    end
  end
end
