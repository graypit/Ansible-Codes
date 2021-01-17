# Icinga2 Agent Automation
<img src="https://www.redhat.com/cms/managed-files/Logotype_RH_AnsibleAutomation_RGB_Black_2.png" width="400">

## What will this playbook do?
#### This playbook will install Icinga2 Agent on your System
P.S Playbook can automatically catch system version (CentOS 7&8)

- On Agent Side:
1. Prepare system
2. Check correct hostname
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

First of all after decryption you should edit your invertory file (hosts) and set Agent Host SSH Credentials.
- To Run playbook just execute the following command
```bash
$ ansible-playbook playbook.yml
```

## What should I Do before executing?
## `!!!` Make sure that your Agent Server has full access to Internet (8.8.8.8)
## `!!!` Make sure that your Agent Server's DNS configured
#### Successfully Tested on CentOS 7 & 8

| Latest stable release | [![release](https://img.shields.io/badge/release-latest-green.svg)]() |
|---|---|

Copyright &copy; 2020 DevOps-Team of Kapital Bank OJSC. All Rights Reserved
