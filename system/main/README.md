# main system

Ansible system configuration.

Change into the path:

```bash
cd system/main
```

## 1. Install Ansible

```bash
pacman -S ansible
```

Then, install the yay module: https://github.com/mnussbaum/ansible-yay

```bash
install_yay_module() {
  module_path="$(python -c """
from ansible import constants
path = constants.config.get_config_value('DEFAULT_MODULE_PATH')[0]
print(path)
  """)"
  mkdir -p "$module_path"
  wget \
    -O "$module_path/yay" \
    https://raw.githubusercontent.com/mnussbaum/ansible-yay/master/yay
}

install_yay_module
```

The ansible constants comes from `ansible-config`, check out
[this link](https://docs.ansible.com/ansible/latest/dev_guide/developing_locally.html#adding-standalone-local-modules-for-all-playbooks-and-roles)
and command `ansible-config dump | grep DEFAULT_MODULE_PATH` to print
variables on the shell.

## 2. Run the playbook

```bash
ansible-playbook -v -i localhost.inventory.ini --ask-become-pass work.yml
```

Enter the sudo password on start.

TODO: check out ansible-vault for secrets.

Reboot the system after the installation is completed.

<!-- TODO move this below and vagrant into a folder tests/vagrant -->

## Testing

### Vagrant playground

Bring up & reboot & destroy the VM

```
vagrant up
vagrant reload
vagrant destroy -f
```

SSH into VM

```
vagrant ssh

# or manually, from private network
ssh -i .vagrant/machines/default/virtualbox/private_key vagrant@192.168.56.2
```

Run provisions
```
ansible-playbook -v -i vagrant.inventory.ini work.yml
```

+ Use `-vvv` for extra printing to debug Ansible.

### Troubleshooting

+ If can't connect to vagrant, check IP interfaces with `ip a` and find out
  what the range is for `vboxnet0`.

+ If you get unreachable error in ssh, try removing corresponding entries from
  `.ssh/known_hosts` (it's now disabled the SSH host key checking so this is
  unlikely).
