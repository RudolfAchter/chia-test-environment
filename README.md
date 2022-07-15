# chia-test-environment
Ansible Playbooks and Scripts to create a chia test environment

- Fork this repository
- change variables in [group_vars](src/ansible/playbook/group_vars)
- create files for hostnames and set variables in [host_vars](src/ansible/playbook/host_vars)
- run `ansible-playbook` like this:

```bash
cd src/ansible
ansible-playbook -i inventory/test.yml --vault-password-file ~/vaultpass.txt  playbook/chia-test.yml
```