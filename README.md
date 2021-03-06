# Description

Chef Cookbook for Installing Standalone Zenoss Cloud Services Assurance 4.x on Centos

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


# Example using Chef-solo

`roles/zenoss-csa.rb`
    
    name 'zenoss-csa'
    description 'core install of zenoss enterprise'

    run_list(
      "recipe[zenoss-csa]"
    )

    base_url = 'http://10.2.1.1/zenoss/'

    default_attributes(
      :java => {
        :url => base_url + 'jre-6u31-linux-amd64.rpm'
      },
      :zenoss => {
        :repo_url => base_url + 'zenossdeps-4.2.x-1.el6.noarch.rpm',
        :csa_url => base_url + 'zenoss_csa.rpm',
        :msmonitor_url => base_url + 'zenoss_msmonitor.rpm',
        :zends_url => base_url + 'zends.rpm'
      }
    )


   
`nodes/10.1.1.1.json`

    {
      "run_list":[
        "role[zenoss-csa]"
      ]
    }

Using knife-solo run
    
    #knife solo prepare root@10.1.1.1
    #knife cook cook root@10.1.1.1
    
# License and Author
* Author: Stanley Karunditu (stanley at gmail dot com)

Licensed under the Apache License, Version 2.0(the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at
`http://www.apache.org/license/LICENSE-2.0`
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES O CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

