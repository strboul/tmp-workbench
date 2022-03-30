#!/usr/bin/env bash

ansible-playbook "$@" main.yml --tags="""
base,
ntp,
bluetooth,
docker,
python,
language.r,
language.node,
language.deno,
language.golang,
package.zsh,
package.nvim,
package.tmux,
package.pip.python_tools,
package.npm,
package.cli_utils,
package.terraform,
package.c_cpp_tools,
gui.alacritty,
gui.chrome,
gui.chromium,
gui.firefox,
gui.brave,
gui.signal,
gui.rstudio,
gui.flameshot,
gui.dbeaver,
gui.libreoffice,
gui.thunderbird,
gui.gedit,
gui.gnome_disk_utility,
gui.gthumb,
gui.wireshark,
gui.vlc,
gui.keepassxc,
gui.meld,
gui.vscode,
xfce,
"""
