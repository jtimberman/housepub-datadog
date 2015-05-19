# housepub-datadog Cookbook

Site-specific implementation cookbook for interacting with Data Dog.

* http://datadoghq.com

This cookbook is the example from my blog post about [deleting attributes](http://jtimberman.housepub.org/blog/2014/12/24/quicktip-delete-attributes/).

# Requirements

### Cookbooks

- datadog v2.1

# Attributes

* `node['datadog']['encrypted_databag']` - If your data bag items are
  encrypted (all or none), set this to true. Default is false.

# Usage

Create a data bag called "datadog". It should have an item for the
following:

1. Your datadog service API key.
2. Your datadog application API keys.

For example:

```json
{
  "id": "datadog",
  "data": {
    "api_key": "DATADOG-API-KEY",
    "chef": "DATADOG-CHEF-APPLICATION_KEY"
  }
}
```

Then upload it to the Chef Server using `chef-vault`

```
knife vault create secrets datadog --mode client -J data_bags/secrets/datadog_unencrypted.json -A ADMINUSER -S '*:*'
```

# License and Authors

Author: Joshua Timberman <opensource@housepub.org>

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
