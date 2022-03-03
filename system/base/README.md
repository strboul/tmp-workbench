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
ansible-playbook -v -i localhost.inventory --ask-become-pass playbooks/main.yml
```

See more at [ansible.md](ansible.md).

`--ask-become-pass` will ask you to enter the sudo password in the beginning.

<!-- TODO: check out ansible-vault for secrets. -->

Reboot the system after the installation is completed.
