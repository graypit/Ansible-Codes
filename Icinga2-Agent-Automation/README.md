# Icinga2 Agent Automation
<img src="https://www.redhat.com/cms/managed-files/Logotype_RH_AnsibleAutomation_RGB_Black_2.png" width="400">

## What will this playbook do?
#### This playbook will install Icinga2 Agent on your System

- On Agent Side:
1. Prepare system
2. Check correct hostname (set it in `vars/GlobalVars.yml`)
3. Install Icinga2 Agent
4. Install All Plugins + Local
5. Full Setup/Configure Icinga2 Agent
6. Enable and Start service
- On Server Side:
1. Generate token for Agent CN
2. Set & Configure Zone for agent
3. Set & Configure Config file for agent
4. Check service configurations
5. Reload service to apply changes

## How to Run ?
### First of all you should edit your invertory file (hosts) and set Credentials/Values
### Set the variables `vars/GlobalVars.yml` up
- To Run playbook just execute the following command
```bash
$ ansible-playbook playbook.yml
```

## What should I Do before executing?
## `!!!` Make sure that your Agent Server has access to Internet
#### Successfully Tested on CentOS 7 & 8

| Latest stable release | [![release](https://img.shields.io/badge/release-latest-green.svg)]() |
|---|---|

Copyright &copy; 2021 | Habib Guliyev | All Rights Reserved
