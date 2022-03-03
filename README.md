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

Recommended to install the parts of the workbench in the following order:

| #  | step                   | part                                                 |
|:---|:-----------------------|:-----------------------------------------------------|
| 1. | Install core OS system | [system/core/archinstall/](system/core/archinstall/) |
| 2. | Link dotfiles          | [dotfiles/](dotfiles/)                               |
| 3. | Provision main system  | [system/main/](system/main/)                         |
| 4. | Add bin/ to the path   | [bin/](bin/)                                         |

## Folder structure

```sh
.
├── bin/                  # my custom CLI helpers
│   └── ...
├── dotfiles/             # my custom config files
│   └── ...
└── system/               # system provision/installation
    ├── core/                 # core OS installation
    │   └── ...
    └── base/                 # base system provision with Ansible
        ├── playbooks/
        │   └── ...
        └── tests/
            └── ...
```

Check the most up-to-date structure with `tree --dirsfirst .` and `tree -d .`
