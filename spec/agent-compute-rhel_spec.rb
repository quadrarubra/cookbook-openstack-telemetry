# encoding: UTF-8

require_relative 'spec_helper'

describe 'openstack-telemetry::agent-compute' do
  describe 'rhel' do
    let(:runner) { ChefSpec::SoloRunner.new(REDHAT_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) { runner.converge(described_recipe) }

    include_context 'telemetry-stubs'
    include_examples 'expect-runs-common-recipe'

    it 'installs the agent-compute package' do
      expect(chef_run).to upgrade_package 'openstack-ceilometer-compute'
    end

    it 'starts ceilometer-agent-compute service' do
      expect(chef_run).to start_service('openstack-ceilometer-compute')
    end
  end
end
