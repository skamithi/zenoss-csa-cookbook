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

include_recipe 'zenoss-csa::remove_pkgs'

include_recipe 'zenoss-csa::java'

include_recipe 'zenoss-csa::deps'

include_recipe 'zenoss-csa::core'





