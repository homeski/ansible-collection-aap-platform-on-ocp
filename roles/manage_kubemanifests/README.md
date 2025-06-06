manage_kubemanifests
=========

A role to manage (create, apply, or delete) the Kubernetes manifest files created for an AAP Operator deployment.

Requirements
------------

You must pass in the role variables defined below as needed.

Role Variables
--------------

| Variable Name | Default Value | Required | Type | Description |
| :---: | :--- | :---: | :---: | :---: |
|manage_kubemanifests_state|present|false|string|The state to put the managed kubenetes objects into. Valid values are `present` or `absent`
|manage_kubemanifests_template_dir|`../kubemanifests/{{ inventory_hostname }}/generated`|false|str|The directory that holds the generated kubemanifests files

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

License
-------

GPL-3.0-or-later

Author
------------------

[Homero Pawlowski](https://github.com/homeski)
