# main

[Ansible](https://www.ansible.com/) system configuration.

Be sure that you run the changes from the path:

```sh
cd system/main
```

## 1. Install Ansible

```sh
pacman -S ansible
```

Then, install the `ansible-yay` module: https://github.com/mnussbaum/ansible-yay

```sh
install_ansible_yay() {
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

install_ansible_yay
```

The ansible constants can be seen at `ansible-config`. For further information,
check out
[this link](https://docs.ansible.com/ansible/latest/dev_guide/developing_locally.html#adding-standalone-local-modules-for-all-playbooks-and-roles)
and the command, e.g. `ansible-config dump | grep DEFAULT_MODULE_PATH`.

## 2. Run the playbooks

Run the Ansible playbooks against the localhost, the current machine.

```sh
ansible-playbook -v -i localhost.inventory --ask-become-pass playbooks/work.yml
```

Enter the sudo password on start.

<!-- TODO: check out ansible-vault for secrets. -->

Reboot the system after the installation is completed.
