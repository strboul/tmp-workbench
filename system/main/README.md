# main

[Ansible](https://www.ansible.com/) system configuration.

Be sure that you run the changes from the path:

```sh
cd system/main
```

## 1. Setup Ansible

Install Ansible and AUR module.

```sh
sudo pacman -S ansible
ansible-galaxy collection install kewlfft.aur
```

## 2. Run the playbooks

Run a playbook profile (with certain tags):

```sh
./profiles/work.sh -i localhost.inventory --ask-become-pass
```

:arrow_right: See more Ansible options at [ansible.md](ansible.md)

<!-- TODO: check out ansible-vault for secrets. -->

Recommended to reboot the system after the installation is completed.
