require 'spec_helper'

describe 'brltty' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "brltty class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('brltty::params') }
          it { is_expected.to contain_class('brltty::install').that_comes_before('brltty::config') }
          it { is_expected.to contain_class('brltty::config') }
          it { is_expected.to contain_class('brltty::service').that_subscribes_to('brltty::config') }

          it { is_expected.to contain_service('brltty') }
          it { is_expected.to contain_package('brltty').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'brltty class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('brltty') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
