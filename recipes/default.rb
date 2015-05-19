#
# Cookbook Name:: housepub-datadog
# Recipe:: default
#
# Copyright 2013, Joshua Timberman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-vault'

node.default['datadog']['api_key'] = chef_vault_item(:secrets, 'datadog')['data']['api_key']
node.default['datadog']['application_key'] = chef_vault_item(:secrets, 'datadog')['data']['chef']

include_recipe 'datadog::dd-agent'

ruby_block 'smash-datadog-auth-attributes' do
  block do
    node.rm('datadog', 'api_key')
    node.rm('datadog', 'application_key')
  end
  subscribes :create, 'template[/etc/dd-agent/datadog.conf]', :immediately
end
