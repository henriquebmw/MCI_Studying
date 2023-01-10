Implementation of MCI_Studying and implementing Ansible and Python

Cache: 

This is the folder with the main configuration of the cache instance and its file system: https://cc-github.bmwgroup.net/mci/periodic-maintenance/tree/master/cache_server_configuration 

This cache instance is hosted in OpenStack cloud. This playbook configures the necessary credentials for Zuul to have access to the OpenStack instance and also the Samba user credentials: https://cc-github.bmwgroup.net/mci/periodic-maintenance/blob/master/cache_server_configuration/cloud-config.yaml 

After the credentials are configured, this playbook launches the instance in OpenStack and configures the external volume where the Samba cache will be configured: https://cc-github.bmwgroup.net/mci/periodic-maintenance/blob/master/cache_server_configuration/config-servers.yaml 

The MCI build jobs configures the cache in the Zuul instance with this role: https://cc-github.bmwgroup.net/mci/mci/blob/master/roles/mci-docker-build/tasks/main.yaml 

This role configures the Shell script which runs the build commands. This script also have some cache configuration (some environment variables that are configured inside the container). This is the last step, when the ccache runs with cmake: https://cc-github.bmwgroup.net/mci/mci/blob/master/roles/mci-docker-build/files/script.sh.j2#L8-L17 

 

Generate meta-data: 

All the steps to generate and update the projects meta-data are defined in this file: https://cc-github.bmwgroup.net/mci/periodic-maintenance/blob/master/roles/upload_project_meta_data/tasks/main.yaml 

All the Python scripts and JSON files it uses are saved here: https://cc-github.bmwgroup.net/mci/periodic-maintenance/tree/master/roles/upload_project_meta_data/files 

The info about the repositories using MCI are collect from Zuul API and from cross-checked with this repository info: https://cc-github.bmwgroup.net/mci/mci-project-config/tree/master/config 

The mci-project-config repository is used as a submodule in the periodic-maintenance repository, then our Python scripts get information about the repositories from it. 

After the role finishes collecting all info, the projects meta-data is sent to the data base using this collectr endpoint: https://mci-collectr.bmwgroup.net/3.0/ui/#/project 

The projects meta-data is then used to generate our Grafana's dashboards: https://mci-grafana.bmwgroup.net/dashboards 

 
