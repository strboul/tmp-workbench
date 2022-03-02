# workbench

Once upon a time, this was just *dotfiles* with a setup script but it now has
the full *workbench*.

It's totally possible to use the parts, like `/bin` or `/dotfiles`, not
necessary to install the full suite.

Fully supports Arch Linux :penguin:

## Setup

Clone this repository into your home (`$HOME/`) directory, and then change
directory into the `workbench` folder. After all, execute the setup script.

```sh
git clone https://github.com/strboul/workbench.git "$HOME"/workbench
```

Recommended to install the parts in the following order:

| #  | step                   | guide                                                |
|:---|:-----------------------|:-----------------------------------------------------|
| 1. | Install core OS system | [system/core/archinstall/](system/core/archinstall/) |
| 2. | Link dotfiles          | [dotfiles/](dotfiles/)                               |
| 3. | Provision main system  | [system/main/](system/main/)                         |
| 4. | Add bin/ to the path   | [bin/](bin/)                                         |

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
