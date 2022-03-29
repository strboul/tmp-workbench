# workbench

Once upon a time, this was just *dotfiles* with a setup script but it now has
the full *workbench*.

It's totally possible to use the parts, not necessary to install the full
suite.

Fully supports Arch Linux :penguin:

## Setup

Clone this repository into your home (`$HOME/`) directory, and then change
directory into the `workbench` folder.

```sh
git clone https://github.com/strboul/workbench.git "$HOME"/workbench
cd "$HOME/workbench"
```

Recommended steps to install the parts in the following order:

| #  | step                   | part                         |
|:---|:-----------------------|:-----------------------------|
| 1. | Install core OS system | [system/core/](system/core/) |
| 2. | Link dotfiles          | [files/](files/)             |
| 3. | Provision main system  | [system/main/](system/main/) |
| 4. | Add bin/ to the path   | [bin/](bin/)                 |

## Folder structure

<!--
Run `tree -d .` for the updated structure.
-->
```sh
├── bin/          # my custom helpers
│   └── ...
├── files/        # my custom files (dotfiles)
│   └── ...
└── system/       # system provision/installation
    ├── core/     # core OS installation
    │   └── ...
    └── main/     # system provision with Ansible
        └── ...
```

In the end, reboot the machine to complete the installation.
