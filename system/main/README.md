# main

[Ansible](https://www.ansible.com/) system configuration.

Be sure that you run the changes from the path:

```sh
cd system/main
```

## 1. Setup Ansible

Install Ansible and AUR module.

```sh
pacman -S ansible
ansible-galaxy collection install kewlfft.aur
```

## 2. Run the playbooks

Run the Ansible playbooks against the localhost, the current machine.

```sh
# main playbook:
ansible-playbook -i localhost.inventory --ask-become-pass main.yml

# individual playbooks, e.g.
ansible-playbook -i localhost.inventory --ask-become-pass playbooks/base/main.yml
```

See more Ansible options at [ansible.md](ansible.md).

<!-- TODO: check out ansible-vault for secrets. -->

Reboot the system after the installation is completed.
