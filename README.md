# Description

Chef Cookbook for Installing Standalone Zenoss Enterprise 4.x on Centos

# Requirements

## Platforms


* Centos 6.x
* RHEL 6.x
  
# Attributes

See `attributes/default.rb` for default values

* `node['java']['url']` - URL where Java 1.6.x Oracle RPM is located.
* `node['java']['home']` - Default location for `$JAVA_HOME`
* `node['zenoss']['repo_url']` - URL where Zenoss Repo Dependency RPM is located
* `node['zenoss']['csa_url']` - URL where Zenoss Enterprise RPM is located
* `node['zenoss']['msmonitor_url']` - URL where Zenoss MSMonitor RPM is located
* `node['zenoss']['zends_url']` - URL where Zends RPM is located
* `node['zenoss']['install_dir']` - Location where zenoss is installed
* `node['zends']['install_dir']` - Location where zends is installed

# Recipes

## default
Installs zenoss enterprise on RHEL 6.x or Centos 6.x. System may have an existing zenoss install. This is wiped out completely, including database files. Installs only a Zenoss standalone setup. 

## deps
Installs RPMs dependencies for zenoss

## java
Installs Oracle JRE 1.6.x required for zenoss. 

## remove_pkgs
Remove zenoss, zends and rabbitmq related files of any previously installed zenoss install.

## set_java_home
Sets the java home environment variable

## core
Installs Zends and Zenoss enterprise. Initializes the database for the first time.


# License and Author
* Author: Stanley Karunditu (stanley@juaconsulting.com)

Licensed under the Apache License, Version 2.0(the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at
`http://www.apache.org/license/LICENSE-2.0`
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES O CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

