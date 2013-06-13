#
# Cookbook Name:: zenoss
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# turn off iptables
service 'iptables' do
  action [ :disable, :stop ]
end
# turn off ip6tables
service 'ip6tables' do
  action [ :disable, :stop ]
end

include_recipe 'zenoss::remove_pkgs'

include_recipe 'zenoss::java'

include_recipe 'zenoss::deps'

include_recipe 'zenoss::core'

=begin
# install rabbitmq
package 'rabbitmq-server' do
  action: install
  version '2.8.6'
end

package 'memcached' do
  action: install
end

package 'net-snmp' do
  action :install
end

package 'net-snmp-utils' do
  action: install
end

service 'memcached' do
  action [:enable, :start]
end

service 'snmpd' do
  action [:enable, :start]
end

=end





