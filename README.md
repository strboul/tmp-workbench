# workbench

Once upon a time, this was just *dotfiles* with a setup script but it now has
the full *workbench*.

It's totally possible to use the parts, like `/bin` or `/dotfiles`, not
necessary to install the full workbench.

Fully supports Arch Linux :penguin:

## Parts

+ [Arch Linux](https://archlinux.org/) installed in core.

+ [Ansible](https://www.ansible.com/) is used for main system provisioning.

## Folder structure

```sh
.
├── bin                  # my custom CLI helpers
│   └── ...
├── dotfiles             # my custom config files
│   └── ...
└── system               # system provision/installation
    ├── core                 # OS installation
    │   └── ...
    └── main                 # provision with Ansible
        ├── roles
        │   ├── bluetooth
        │   │   └── ...
        │   ├── core             # core system provision
        │   │   └── ...
        │   └── dotfiles         # dotfiles provision
        │       ├── base         # base dotfiles, for all playbooks
        │       │   ├── ...
        │       └── extra        # extra dotfiles, installed by tags
        │           └── ...
        ├── personal.yml
        └── work.yml
```

Check the most up-to-date structure with `tree --dirsfirst .` and `tree -d .`

## Setup

After you install the OS;

### 1. Clone the repository

Clone this repository into your home (`$HOME/`) directory, and then change
directory into the `dotfiles` folder. After all, execute the setup script.

```bash
git clone https://github.com/strboul/workbench.git "$HOME"/dotfiles
cd "$HOME"/dotfiles && ./setup.sh
```

### 2. Install Ansible

First, install Ansible:

```bash
pacman -S ansible
```

Then, install the yay module: https://github.com/mnussbaum/ansible-yay

```bash
module_path="$(python -c """
from ansible import constants
path = constants.config.get_config_value('DEFAULT_MODULE_PATH')[0]
print(path)
""")"
wget -O "$module_path/yay" https://raw.githubusercontent.com/mnussbaum/ansible-yay/master/yay
# returns something like ~/.ansible/plugins/modules
```

The ansible constants comes from `ansible-config`, check out
[this link](https://docs.ansible.com/ansible/latest/dev_guide/developing_locally.html#adding-standalone-local-modules-for-all-playbooks-and-roles)
and command `ansible-config dump | grep DEFAULT_MODULE_PATH` to print
variables on the shell.

### 3. Run the playbook

```bash
ansible-playbook system/personal.yml
```

Reboot the system after the installation is completed.
