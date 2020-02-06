# Ansible PostgreSQL-12 Automation
<img src="https://www.redhat.com/cms/managed-files/Logotype_RH_AnsibleAutomation_RGB_Black_2.png" width="400">

## What will this playbook do?

1. Install PostgreSQL 12
2. Initialize Database
3. Create Database  # From Vars
4. Create DB Username with Password  # From Vars
5. Grant All privileges from created user to created DB
6. Update Configuration files from SCM (You should prepare your configs repo)
7. Uninstall PostgreSQL 12 (Without wipe data)

First of all you should edit your invertory file (hosts) and set Target SSH Credentials.
Then you should edit your variables files under `/vars/` folder
Then:
- To Install PostgreSQL 12
```bash
$ ansible-playbook playbook.yml -e please=install
```
- To Uninstall PostgreSQL 12
```bash
$ ansible-playbook playbook.yml -e please=uninstall
```
- To Update PostgreSQL 12 Configuration files
```bash
$ ansible-playbook playbook.yml -e please=update
```
## What should I Do before executing?
## Make sure that your Target Server has full access to Internet
#### Successfully Tested on RHEL7/CentOS7

| Latest stable release | [![release](https://img.shields.io/badge/release-latest-green.svg)](https://github.com/graypit/ansible-codes/tree/master/PostgreSQL-12-Automation) |
|---|---|