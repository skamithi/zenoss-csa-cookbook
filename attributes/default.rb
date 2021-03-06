# Check if this link to download Oracle JRE still works
# http://javadl.sun.com/webapps/download/AutoDL?BundleId=59622
# If so, download and extract the RPM file to a local web server that also 
# stores the zenoss enterprise RPMs
# Example: 'http://myweb.site/jre-6u31-linux-amd64.rpm'
# Define variable in 'roles/zenoss.rb'
default['java']['url'] = ''
default['java']['java_home'] = '/usr/java/default/bin'

default['zenoss']['install_dir'] = '/opt/zenoss'
default['zends']['install_dir'] = '/opt/zends'

# Define these variables in roles/zenoss.rb
# can then call 'roles[zenoss]' in your run_list in 'node/servername.json' file
default['zenoss']['repo_url'] =  ''
default['zenoss']['csa_url'] = ''
default['zenoss']['msmonitor_url'] = '' 
default['zenoss']['zends_url'] = ''






