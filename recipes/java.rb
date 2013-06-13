java_url = node['java']['url']
java_rpm_location = '/tmp/jre.rpm'

include_recipe 'zenoss-csa::set_java_home'

remote_file java_rpm_location do
  source java_url
  mode 00644
end

rpm_package 'jre' do
 source java_rpm_location
 action :install
end
