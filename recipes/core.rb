zends_url = node['zenoss']['zends_url']
zenoss_csa_url = node['zenoss']['csa_url']
zenoss_monitor_url = node['zenoss']['msmonitor_url']

zends_rpm_local = '/tmp/zends.rpm'
remote_file zends_rpm_local do
  source zends_url
  mode 0444
end

zenoss_csa_local = '/tmp/zenoss_csa.rpm'
remote_file zenoss_csa_local do
  source zenoss_csa_url
  mode 0444
end

zenoss_msmonitor_local = '/tmp/zenoss_msmonitor.rpm'
remote_file zenoss_msmonitor_local do
  source zenoss_monitor_url
  mode 0444
end

yum_package 'zends' do
  source zends_rpm_local
  options '--nogpgcheck'
end

service 'zends' do
  action [:enable, :start]
end

yum_package 'zenoss_csa' do
  source zenoss_csa_local
  options '--nogpgcheck'
end


execute 'get mysqltuner' do
  user 'root'
  command "su -c 'cd $ZENHOME/bin; rm mysqltuner.pl; wget mysqltuner.pl; chmod 755 mysqltuner.pl' -l zenoss"
end

service 'zenoss' do
  action [:enable]
end

execute 'start zenoss' do
 user 'root'
 command "service zenoss start"
end

execute 'stop zenoss' do
  user 'root'
  command 'service zenoss stop'
end

execute 'start zeneventserver' do
  user 'root'
  command "su -c 'zeneventserver start' -l zenoss"
end

execute 'start zencatalogservice' do
  user 'root'
  command 'su -c "zencatalogservice start" -l zenoss'
end

yum_package 'zenoss_msmonitor' do
  source zenoss_msmonitor_local
  options '--nogpgcheck'
end

execute 'restart zenoss' do
  user 'root'
  command 'service zenoss restart'
end

