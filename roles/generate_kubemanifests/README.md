generate_kubemanifests
=========

A role to template the Kubernetes manifest files needed for an AAP Operator installation.

Requirements
------------

You must pass in the role variables defined below as needed.

Role Variables
--------------

| Variable Name | Default Value | Required | Type | Description |
| :---: | :--- | :---: | :---: | :---: |
|namespace|`unset`|true|str|The OCP namespace to use for created resources|
|name_controller|`unset`|false|str|The name of the created AutomationController resources|
|name_gateway|`unset`|false|str|The name of the created AutomationAutomationPlatform resource|
|name_eda|`unset`|false|str|The name of the created EDA resource|
|name_hub|`unset`|false|str|The name of the created AutomationHub resource|
|ansibleautomationplatform|`unset`|false|dict|The dictionary configuration for the AnsibleAutomationPlatform resource|
|automationcontroller|`unset`|false|dict|The dictionary configuration for the AutomationController resource|
|automationhub|`unset`|false|dict|The dictionary configuration for the AutomationHub resource|
|eda|`unset`|false|dict|The dictionary configuration for the EDA resource|
|template_dir|`../kubemanifests/{{ inventory_hostname }}/generated`|false|str|The directory to generate the kubemanifests in|
|template_empty|`false`|false|str|Whether to delete existing files in the template directory|

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

License
-------

GPL-3.0-or-later

Author Information
------------------

Homero Pawlowski (homeski2@gmail.com)
