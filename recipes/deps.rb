zenoss_repo_loc = '/tmp/zenoss_deps.rpm'

zenoss_repo_url = node['zenoss']['repo_url']
remote_file zenoss_repo_loc do
  source zenoss_repo_url
  mode 00444
end

package 'zenoss-dependencies' do
  source zenoss_repo_loc
  action  :install
end

%w{ wget rabbitmq-server memcached net-snmp net-snmp-utils }.each do |zenoss_dep_pkg|
  package zenoss_dep_pkg do
    action :install
  end
end


%w{ rabbitmq-server memcached snmpd }.each do |zenoss_dep_service|
  service zenoss_dep_service do
    action [:enable, :start]
  end
end

