package 'zenoss_csa' do
  action :remove
end

package 'zends' do 
  action :remove
end

# delete /opt/zenoss and /opt/zends directories
%w{ zenoss zends }.each do |pkg|
  directory node[pkg]['install_dir'] do
    action :delete
  end
end

# remove unwanted java files
# TODO print which packages it is removing
execute 'remove unwanted java files' do
  command "rpm -qa | awk '$1 ~ /java|jre|jdk/ { print $1 }' | xargs --no-run-if-empty rpm -e "
end

