# workbench

Once upon a time, this was just *dotfiles* with a setup script but it now has
the full *workbench*.

It's totally possible to use the parts, like `/bin` or `/dotfiles`, not
necessary to install the full suite.

Fully supports Arch Linux :penguin:

## Parts

+ [Arch Linux](https://archlinux.org/) installed in core.

+ [Ansible](https://www.ansible.com/) is used for main system provisioning.

## Folder structure

```sh
.
├── bin/                  # 1. my custom CLI helpers
│   └── ...
├── dotfiles/             # 2. my custom config files
│   └── ...
└── system/               # 3. system provision/installation
    ├── core/                 # 3.1. OS installation
    │   └── ...
    └── main/                 # 3.2. provision with Ansible
        ├── roles/
        │   ├── bluetooth/
        │   │   └── ...
        │   ├── core/             # core system provision
        │   │   └── ...
        │   └── dotfiles/         # dotfiles provision
        │       ├── base/         # base dotfiles, for all playbooks
        │       │   ├── ...
        │       └── extra/        # extra dotfiles, installed by tags
        │           └── ...
        ├── personal.yml
        └── work.yml
```

Check the most up-to-date structure with `tree --dirsfirst .` and `tree -d .`

## Setup

### Setup everything

Clone this repository into your home (`$HOME/`) directory, and then change
directory into the `workbench` folder. After all, execute the setup script.

```bash
git clone https://github.com/strboul/tmp-workbench.git "$HOME"/workbench
```

| #  | Steps                  | Guide                                                |
|:---|:-----------------------|:-----------------------------------------------------|
| 1. | Install core OS system | [system/core/archinstall/](system/core/archinstall/) |
| 2. | Provision main system  | [system/main/](system/main/)                         |
| 3. | Link dotfiles          | [dotfiles/](dotfiles/)                               |
| 4. | Add bin/ to the path   | [bin/](bin/)                                         |
