## Ansible notes

### Playbooks

Run the Ansible playbooks against the current machine

```sh
ansible-playbook -v -i localhost.inventory --ask-become-pass main.yml
```

### Tasks

List tasks

```sh
ansible-playbook main.yml --list-tasks
```

### Tags

List tags

```sh
ansible-playbook main.yml --list-tags
```

Run only tags

```sh
ansible-playbook -v -i <inventory> main.yml --tags="packages.zsh,packages.nvim"
```

### Other arguments

| argument            | description                                              |
|:--------------------|:---------------------------------------------------------|
| `--ask-become-pass` | will ask you to enter the sudo password in the beginning |
| `--step`            | one-step-at-a-time: confirm each task before running     |
